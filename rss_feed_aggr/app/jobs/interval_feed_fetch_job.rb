require "categories_provider_service"

class IntervalFeedFetchJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ##################################################################################################
    ### To simulate a recurring job, we'll check for updates asynchronously on every feeds/index call
    ##################################################################################################

    # Go thru all the Feeds and check if it's time to update any:
    Feed.all.each do |feed|
      fresh_feed_object = Feedjira::Feed.fetch_and_parse(feed.url)
      last_mod_time = feed.updated_at
      
      if (!feed.feed_active)
        print feed.name, " : FEED UPDATE INACTIVE, PASS | \n"
        next feed
      end

      if (feed.feed_active and ( ((Time.now - last_mod_time)/60).minutes >= feed.update_interval.minutes))
        print feed.name, " : FEED ACTIVE FOR UPDATING, BUT UPDATE INTERVAL NOT MET | \n"
        next feed
      end

      print feed.name, " : UPDATE INTERVAL MET, CHECK FOR UPDATES | "
      # we need the most recent publish datetime from remote:
      fresh_date = fresh_feed_object.entries.first.published
      # and our stored local most recent date:
      pers_date = feed.entries.sort_by(&:published).reverse.first.published

      if fresh_date > pers_date
        print feed.name, " : NEW ENTRIES ON REMOTE, FETCH UPDATES | "
        # no need to sort cause they come sorted
        new_entries = fresh_feed_object.entries.first(feed.keep_n_last)
        replace_counter = 0 # how many old entries should we remove
        # Loop thru new feeds and add non-duplicates
        new_entries.each do |ne|
          unless Entry.exists? :guid => ne.id
            replace_counter += 1
            append_entry(feed, ne)
          else
            next ne
          end
        end
        print feed.name, " : REMOVING ", replace_counter, " OUTDATED ENTRIES | \n"
        feed.entries.sort_by(&:published).first(replace_counter).each do |rem|
          rem.destroy
        end
        CategoriesProviderService.call

      else
        print feed.name, " : NO NEW ENTRIES, PASS | \n"
      end
    end # Feed.all
    print "INTERVAL CHECK DONE FOR ALL FEEDS, EXITING | \n"
    
    
  end # perform
  
  def append_entry(feed, new_entry_data)
    # save new feed entries
    feed.entries.create!(
      url: new_entry_data[:url],
      guid: new_entry_data.id,
      title: new_entry_data.title || "Title not given",
      author: new_entry_data.author || "Not given",
      summary: new_entry_data.summary || "Summary not given",
      published: new_entry_data.published,
      categories: new_entry_data.categories || ["Not given"],
      content: new_entry_data.content || "No further contnent"
    )
  end # append
end # Job Class
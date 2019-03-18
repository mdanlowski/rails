require "categories_provider_service"

class InitialFeedFetchJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    feed = args[0]
    feed_url = args[1]

    # feed = args[0]
    # source_feed_object = args[1][:obj]
    source_feed_object = Feedjira::Feed.fetch_and_parse(feed_url)

    entries_to_save = source_feed_object.entries.first(feed.keep_n_last)
    # save feed entries
    for ith_entry in (0..feed.keep_n_last-1) do
      unless Entry.exists? :guid => entries_to_save[ith_entry].id
        feed.entries.create!(
          url: entries_to_save[ith_entry][:url],
          guid: entries_to_save[ith_entry].id,
          title: entries_to_save[ith_entry].title || "Title not given",
          author: entries_to_save[ith_entry].author || "Not given",
          summary: entries_to_save[ith_entry].summary || "Summary not given",
          published: entries_to_save[ith_entry].published,
          categories: entries_to_save[ith_entry].categories || ["Not given"],
          content: entries_to_save[ith_entry].content || "No further contnent"
        ) 
      end

    end
    CategoriesProviderService.call
  end
end
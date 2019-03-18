require 'validator_service.rb'

class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :edit, :update, :destroy]
  before_action :update_entries_job, only: [:index]

  def index
    @feeds = Feed.all

  end

  def show
    @entries = @feed.entries.sort_by(&:published).reverse
  end

  ### non REST ###
  def filter
    @category = filter_params[:category]
    @filtered_entries = []
    #Entry.where(categories.include? @category) # :((
    Entry.all.each do |filter_entry|
      if filter_entry.categories.include? @category
        @filtered_entries.push(filter_entry)
      else
        next filter_entry
      end
    end
  end

  def new
    @feed = Feed.new
  end

  def edit
  end

  def create
    @feed = Feed.new(feed_params)
    fill_remaining_data(@feed, @@feed_data)
    unless Feed.exists? :url => (@feed.url)
      if @feed.save
        persist_feed_entries(@feed, @@feed_data)
        flash[:notice] = 'Feed was successfully created.'
        redirect_to @feed
      else
        flash[:alert] = 'Feed was not created.'
        redirect_to new_feed_path
      end
    else
      flash[:alert] = 'You have already subscribed to this channel.'
      redirect_to new_feed_path
    end
  end

  def update
    # *** Here we check if persistence count was changed **
    old_count = @feed.keep_n_last
    if @feed.update(edit_feed_params)
      if @feed.keep_n_last > old_count
        # PULL ADDITIONAL ENTRIES FROM REMOTE
        InitialFeedFetchJob.perform_later(@feed, @feed.url)
        flash[:notice] = 'Feed was successfully updated. Refresh to see new entries.'

      elsif @feed.keep_n_last < old_count
        # REMOVE OUTOFBOUNDS ENTRIES FROM LOCAL STORAGE
        to_remove = old_count - @feed.keep_n_last
        @feed.entries.sort_by(&:published).first(to_remove).each do |rem|
          rem.destroy
        end
        flash[:notice] = 'Feed was successfully updated. Entries truncated.'

      else
        flash[:notice] = 'Feed was successfully updated.'
      end
      redirect_to @feed
    else
      render :edit
    end
    
  end

  def destroy
    @feed.destroy!
    flash[:notice] = 'Feed was successfully removed.'
    redirect_to feeds_url
    
  end

  # help
  def prevalidate
    @result = ValidatorService.new(prevalidate_params[:url]).call
    @@feed_data = @result
    respond_to do |f|
      f.js
    end
  end

  private
    def set_feed
      @feed = Feed.find(params[:id])
    end


    def prevalidate_params
      params.permit(:url)
    end

    def feed_params
      params.require(:feed).permit(:url, :description, :name, :update_interval, :keep_n_last)
    end

    def filter_params
      params.permit(:category)
    end


    def edit_feed_params
      params.require(:feed).permit(:url, :description, :name, :update_interval, :keep_n_last, :feed_active)
    end

    # @ TODO DELEGATE TO SERVICE/JOB
    def fill_remaining_data(feed, data)
      source_feed_object = data[:obj]

      feed.description = source_feed_object.description
      feed.guid = Digest::MD5.hexdigest(data[:name] + data[:validUrl])
      feed.feed_active = true
      feed.last_published_at = source_feed_object.entries.first.published
      
    end

    def persist_feed_entries(feed, data)
      InitialFeedFetchJob.perform_later(feed, data[:validUrl])

    end

    def update_entries_job
      IntervalFeedFetchJob.perform_later

    end
   
end
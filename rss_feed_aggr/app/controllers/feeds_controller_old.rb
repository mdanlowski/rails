require 'rss'
# @TODO DELETEEEEEEEEEEE!!!!!!!!!!!!!!!!!!!!!!!
require 'open-uri'
require 'fetch_feeds_service.rb'
require 'validator_service.rb'

class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :edit, :update, :destroy]

  def index
    @feeds = Feed.all

  end

  def show
    urls = ["http://www.ruby-lang.org/en/feeds/news.rss",
      "http://feeds.feedburner.com/CssTricks",
      "http://rss.slashdot.org/Slashdot/slashdot",
      "http://feeds.mashable.com/Mashable"]
    feeds = []
    for u in urls do
      rss = open(u)
      feeds.push RSS::Parser.parse(rss)
    end
    @_test_ = FetchFeedsService.new(feeds).call
  end

  def new
    @feed = Feed.new
  end

  def edit
  end

  def create
    @feed = Feed.new(feed_params)
    if @feed.save
      redirect_to @feed, notice: 'Feed was successfully created.'
    else
      render :new, alert: "Something went wrong. Make sure your url is a Feed Channel and try again."
    end
  end

  def update
    if @feed.update(feed_params)
      redirect_to @feed, notice: 'Feed was successfully updated.'
    else
      render :edit, alert: "Something went wrong."
    end
  end

  def destroy
    @feed.destroy
      redirect_to feeds_url, notice: 'Feed was successfully destroyed.'
    end
  end

  # help
  def prevalidate
    result = ValidatorService.new(prevalidate_params[:url]).call
    puts "!!!!!!!!!!!!!!!!!!!!!"
    puts result
    puts "!!!!!!!!!!!!!!!!!!!!!"
    respond_to do |f|
      f.js {render 'prevalidate', @result = result}
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
      params.require(:feed).permit(:index, :show, :new, :create, :delete)
    end
end

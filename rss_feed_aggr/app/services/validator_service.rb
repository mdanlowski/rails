class ValidatorService

  def initialize(url)
    @check_feed = url
  end

  def call
    begin
      try_feed = Feedjira::Feed.fetch_and_parse(@check_feed)
    rescue
      return {
        outcome: "Error",
        errmsg: "Your URL is not a valid RSS, try again."
      }
    end
    return {
      outcome: "Success",
      succmsg: "Success.",
      validUrl: @check_feed.to_s,
      name: try_feed.title,
      description: try_feed.description,
      obj: try_feed
    }
  end

end
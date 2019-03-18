# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

urls = ["http://www.ruby-lang.org/en/feeds/news.rss",
    "http://feeds.feedburner.com/CssTricks",
    "http://rss.slashdot.org/Slashdot/slashdot",
    "http://feeds.mashable.com/Mashable"]

f1 = Feedjira::Feed.fetch_and_parse(urls[3])

Feed.create(
  url: "http://feeds.mashable.com/Mashable",
  name: f1.title,
  description: f1.description,
  guid: "test_feed",
  last_published_at: f1.entries.first.published,
  feed_active: true,
  update_interval: 5,
  keep_n_last: 15
)

for x in (0..14) do
  Feed.first.entries.create!(
    url: f1.entries[x][:url],
    guid: f1.entries[x].id,
    title: f1.entries[x].title || "Title not given",
    author: f1.entries[x].author || "Not given",
    summary: f1.entries[x].summary || "Summary not given",
    published: f1.entries[x].published,
    categories: f1.entries[x].categories || ["Not given"],
    content: f1.entries[x].content || "No further contnent"
  ) 
end

puts "Example feed created"
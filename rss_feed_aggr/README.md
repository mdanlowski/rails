# README

![](dashboard.png)

## Set up
- `bundle install`

- `sudo -u postgres psql`  (provided PSQL is installed)

- > `CREATE DATABASE rss_feeder_development;`
- > `CREATE DATABASE rss_feeder_test;`

- > Exit PSQL with CTRL+Z

- `rake db:migrate`

- `rake db:seed`

- `rails s`

Visit `localhost:3000`


## Starring
- postgresql
- feedjira
- slim
- jquery-rails
- sidekiq
- sidekiq-cron

## Mechanics
- The App is built on top of two entities: Feed and a related Entry. A Feed has many Entries.
- User can see a list of all subscribed Feeds on the root of the application, which is feeds/index
- User can read posts from each Feed channel by opening certain link (feed/show) from the index list
- User can subscribe to new channels with an RSS url, e.g.: http://rss.slashdot.org/Slashdot/slashdot
- New feed form validates the RSS url first (using a special service)
- then it enables setting of Update Interval, Size of Recent Posts to store etc. (using an AJAX response)
- Feed entries are downloaded by an ActiveJob script, initially upon Feed creation and periodically later
- Periodicity is simulated in the following way:
>	A job iterates through all Feed entries (upon index render) and compares the newest posts from the remote sources to the last posts from local storage.
>	If it determines that in a certain Feed, there is new content to download, it fetches the new entries and removes the same amount of the oldest posts,
>	so the total number of persistent posts is always equal to that which the User has set
- As feeds' entries are updated, a special service also updates the categories list
- All fetched categories are presented as a list on the left, each tag can be clicked
- The tag links take the User to the list of entries filtered by this particular category
Sidekiq.configure_server do |config|
  config.redis = { url: "redis://localhost:6379/0" }
  schedule = "config/sched.yml"
  if File.exists? schedule
    Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule)
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://localhost:6379/0" }
end
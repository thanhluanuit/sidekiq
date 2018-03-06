# ActiveJob - Sidekiq Configuration
1. Add gem 'sidekiq'
2. Add sidekiq.rb to config/initializers/

```ruby
Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:6379' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6379' }
end
```

```
Redis url format: 'redis://ip:port'
```

3. Setting queue adapter in config/application.rb

```ruby
module SidekiqApp
  class Application < Rails::Application
    # Be sure to have the adapter's gem in your Gemfile
    # and follow the adapter's specific installation
    # and deployment instructions.
    config.active_job.queue_adapter = :sidekiq
  end
end
```

4. Advance configuration: config/sidekiq.yml
```
:verbose: true
development:
  :concurrency: 1
production:
  :concurrency: 20
:queues:
  - critical
  - default
  - mailers
  - low
:timeout: 60
```

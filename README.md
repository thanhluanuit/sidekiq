#Install Sidekiq
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

3. Add advance configuration: config/sidekiq.yml
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

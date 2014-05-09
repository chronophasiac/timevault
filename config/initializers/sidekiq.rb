Sidekiq.configure_server do |config|
  config.redis = { url: Rails.application.secrets.redis_url, namespace: 'timevault' }
  config.poll_interval = 5
end

Sidekiq.configure_client do |config|
  config.redis = { url: Rails.application.secrets.redis_url, namespace: 'timevault' }
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['HALCALA_TWITTER_KEY'], ENV['HALCALA_TWITTER_SECRET']
end

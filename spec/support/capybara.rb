require "capybara/poltergeist"

Capybara.configure do |config|
  config.match = :prefer_exact
  config.javascript_driver = :headless_chrome
  config.asset_host = "http://#{ENV.fetch('HOST')}"
end

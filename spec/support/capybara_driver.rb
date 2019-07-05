require "selenium/webdriver"

Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: {
      args: %w[
        headless
        no-sandbox
        window-size=1200,800
        disable-extensions
        ignore-ssl-errors
        proxy-server='direct://'
        proxy-bypass-list=*
      ]
    }
  )

  Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: capabilities)
end

module BrowserHelper
  extend self

  def create_new_browser
    # caps = Selenium::WebDriver::Remote::Capabilities.firefox(detach: true)
    # $browser = Watir::Browser.new :firefox, desired_capabilities: caps
    # #$browser = Watir::Browser.new(:firefox, :headless => false) unless $browser
    # caps = Selenium::WebDriver::Remote::Capabilities.firefox
    # caps[:firefox_options] = {detach: true}
    $browser = Watir::Browser.new :firefox, headless: true
  end

  def go_to(url)
    $browser.goto(url)
  end

end
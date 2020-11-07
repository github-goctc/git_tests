module BrowserHelper
  extend self

  def create_new_browser
    $browser = Watir::Browser.new :firefox, headless: false
  end

  def go_to(url)
    $browser.goto(url)
  end

end
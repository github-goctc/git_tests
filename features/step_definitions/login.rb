# -*- encoding : utf-8 -*-on 
Given(/^I login on GitHub with the following credentials$/) do |table|
   BrowserHelper.create_new_browser
   BrowserHelper.go_to("https://github.com/")
   LoginLogoutHelper.login(table.hashes.first)
end

Given(/^the (login|logout) has( no)? success$/) do |action, type|
  case action
    when 'login'
      if type
        assert_equal(false, LoginLogoutHelper.logged_in?)
      else
        assert_equal(true, LoginLogoutHelper.logged_in?)
      end
    when 'logout'
      #type ? assert_equal(false, LoginLogoutHelper.logged_out?) : assert_equal(true, LoginLogoutHelper.logged_out?)
      LoginLogoutHelper.logged_out?
  end
end


Given(/^I logout from GitHub$/) do
  LoginLogoutHelper.logout
end

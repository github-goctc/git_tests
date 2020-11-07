module LoginLogoutHelper
  extend self

  def login(user_pwd)
    $browser.link(href: '/login').wait_until_present
    $browser.link(href: '/login').click

    $browser.div(class: ['auth-form-body', 'mt-3']).wait_until_present

    $browser.text_field(id: 'login_field').value = user_pwd[:username]
    $browser.text_field(id: 'password').value = user_pwd[:password]

    $browser.button(class: ['btn', 'btn-outline', 'flex-1', 'mr-1', 'mx-sm-1', 'm-md-0', 'ml-md-2', 'js-cookie-consent-accept']).click if $browser.button(class: ['btn', 'btn-outline', 'flex-1', 'mr-1', 'mx-sm-1', 'm-md-0', 'ml-md-2', 'js-cookie-consent-accept']).present?
    $browser.input(name: 'commit').click

  end

  def logged_in?
    begin
      $browser.summary(class: 'Header-link').wait_until_present(timeout: 4)
    rescue
      return false
    end
    return true
  end

  def logout
    $browser.images(class: ['avatar', 'avatar-user'])[1].click
    $browser.button(class: ['dropdown-item', 'dropdown-signout']).click
    $browser.link(href: '/login').wait_until_present
  end

  def logged_out?
    $browser.link(href: '/login').present?
  end

end
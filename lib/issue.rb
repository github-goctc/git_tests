module IssueHelper
  extend self

  def create(options)
    $browser.span(text: 'Issues').wait_until_present
    $browser.span(text: 'Issues').click

    $browser.links(href: /.*\/issues\/new\/choose/)[1].click

    $browser.text_field(id: 'issue_title').set(options['title']) if options.has_key?('title')
    $browser.textarea(id: 'issue_body').set(options['description']) if options.has_key?('description')

    $browser.button(text: 'Submit new issue').click

    return true
  end

  def goto_issue(issue_title, status='open')
    $browser.span(text: 'Issues').wait_until_present
    $browser.span(text: 'Issues').click

    case status
      when 'open'
        $browser.link(visible_text: /\d Open/).click
      when 'closed'
        $browser.link(visible_text: /\d Closed/).click
    end

    sleep 2

    begin
      $browser.link(text: issue_title).wait_until_present
      $browser.link(text: issue_title).click
    rescue
      return false
    end
    return true
  end

  def close(options)
    if self.goto_issue(options['title'])
      $browser.button(name: 'comment_and_close').click
      return true
    else
      return false
    end
  end

  def is_closed?(issue_title)
    self.goto_issue(issue_title, 'closed')
  end

  def reopen(options)
    if self.goto_issue(options['title'], 'closed')
      $browser.button(name: 'comment_and_open').click
      return true
    else
      return false
    end
  end

  def is_open?(issue_title)
    self.goto_issue(issue_title)
  end

  def is_reopened?(issue_title)
    self.is_open?(issue_title)
  end



end
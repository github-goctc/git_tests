module NavigationtHelper
  extend self

  def goto_repo(repo)
    $browser.text_field(id: 'dashboard-repos-filter-left').value = repo
    $browser.send_keys(:enter)
    $browser.link(href: /\/.*\/#{repo}/).click

    condition = false
    aux =0
    until (condition or aux==3)
      condition = $browser.url.include?(repo)
      aux=aux+1
      sleep 0.5
    end

    return condition
  end

  def goto_branch(branch)
    $browser.details(id: 'branch-select-menu').summary.click
    $browser.link(href: /.*\/#{branch}$/).wait_until_present
    $browser.links(href: /.*\/#{branch}$/).last.click

    condition = false
    aux =0
    until (condition or aux==3)
      condition = $browser.details(id: 'branch-select-menu').text.include?(branch)
      aux=aux+1
      sleep 0.2
    end

    return condition
  end


end
module ProjectHelper
  extend self

  def create(options)
    $browser.span(text: 'Projects').wait_until_present
    $browser.span(text: 'Projects').click

    $browser.link(href: /.*\/projects\/new/).click

    $browser.text_field(id: 'project_name').set(options['name']) if options.has_key?('name')
    $browser.textarea(id: 'project_body').set(options['description']) if options.has_key?('description')

    $browser.button(text: 'Create project').click

    return true
  end

  def goto_project(project_name, status='open')
    $browser.span(text: 'Projects').wait_until_present
    $browser.span(text: 'Projects').click

    case status
      when 'open'
        $browser.link(text: /\d Open/).click
      when 'closed'
        $browser.link(text: /\d Closed/).click
    end

    sleep 2

    begin
      $browser.link(text: project_name).wait_until_present
      $browser.link(text: project_name).click
    rescue
      return false
    end
    return true
  end


  def delete(options)
    begin
      $browser.span(text: 'Projects').wait_until_present
      $browser.span(text: 'Projects').click

      $browser.div(:'data-filter-value' => options['name'] ).wait_until_present
      #$browser.div(:xpath , "//div[@data-filter-value='#{project_name}']/").wait_until_present
      $browser.div('data-filter-value'.to_sym => options['name']).summary.click
      #$browser.div(:xpath , "//div[@data-filter-value='#{project_name}']/").summary.click
      $browser.link(text: 'Edit').click

      $browser.button(text: 'Delete project').click
      sleep 1
      $browser.alert.ok
      $browser.text_field(id: 'query').wait_until_present
      return true
      rescue
        return false
      end
  end

  def is_deleted?(project_name)
    #begin
      $browser.span(text: 'Projects').wait_until_present
      $browser.span(text: 'Projects').click

      $browser.text_field(id: 'query').wait_until_present
      $browser.text_field(id: 'query').set("name:#{project_name} ")
      sleep 1
      $browser.send_keys(:enter)

      $browser.h3(text: 'No projects matched your search').wait_until_present(timeout: 3)
      return true
    # rescue
    #   false
    # end
  end
end
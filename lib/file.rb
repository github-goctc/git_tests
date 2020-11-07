module FileHelper
  extend self

  def upload(file)
    $browser.span(text: /.*Add file.*/).click
    $browser.link(text: /.*Upload files.*/).click

    Watir.relaxed_locate = false
    $browser.file_field(id: 'upload-manifest-files-input').wait_until_present
    $browser.file_field(id: 'upload-manifest-files-input').set (file)
    Watir.relaxed_locate = true

    $browser.div(class: ['js-manifest-file-list-root']).wait_until_present

    $browser.div(class: ['js-manifest-file-list-root']).text.include?(File.basename(file)) ? true: false
  end

  def commit_upload(options)
    $browser.div(class: ['commit-form', 'position-relative', 'p-3', 'mb-2', 'border', 'rounded-1']).wait_until_present

    $browser.text_field(id: 'commit-summary-input').set(options['comment']) if options.has_key?('comment')
    $browser.textarea(id: 'commit-description-textarea').set(options['description']) if options.has_key?('description')

    $browser.button(class: ['btn', 'btn-primary', 'js-blob-submit']).click

    $browser.link(href: /.*\/#{options['file']}/).wait_until_present

  end


  def goto_file(file)
    $browser.link(text: 'Go to file').wait_until_present
    $browser.links(text: 'Go to file').first.click

    $browser.text_field(id: 'tree-finder-field').set(file)
    sleep 1

    if $browser.div(class: 'no-results blankslate ').present?
      return false
    else
      $browser.link(href: /.*#{file}$/).wait_until_present
      $browser.link(href: /.*#{file}$/).click
      $browser.h2(text: /.*\/#{file}/).wait_until_present
      return true
    end
  end

  def delete(file)
    $browser.button(class: ['btn-octicon', 'btn-octicon-danger', 'tooltipped', 'tooltipped-nw']).click if self.goto_file(file)
    return true
  end

  def commit_delete(options)
    $browser.div(class: ['commit-form', 'position-relative',  'mb-2', 'p-3', 'border-0', 'border-lg-top', 'border-lg-right', 'border-lg-left', 'border-lg-bottom', 'rounded-1']).wait_until_present

    $browser.text_field(id: 'commit-summary-input').set(options['comment']) if options.has_key?('comment')
    $browser.textarea(id: 'commit-description-textarea').set(options['description']) if options.has_key?('description')

    $browser.button(id: 'submit-file').click

    condition = false
    aux =0
    until (condition or aux==100)
      condition = !$browser.button(id: 'submit-file').present?
      aux=aux+1
      sleep 0.2
    end

  end


  def edit(file, options)
    if self.goto_file(file)
      $last_commit = $browser.span(text: 'Latest commit').parent.link.text
      puts "------------------------"
      puts $last_commit
      puts "------------------------"
      $browser.button(class: ['btn-octicon', 'tooltipped', 'tooltipped-nw']).click
      #$browser.execute_script( "return arguments[0].textContent = '#{options['value']}'", $browser.pre(class: ' CodeMirror-line ').span)
      $browser.pre(class: ' CodeMirror-line ').click
      $browser.send_keys(:end, " #{options['value']}")
      return true
    else
      return false
    end
  end

  def commit_edit(options)
    $browser.div(class: ['commit-form', 'position-relative',  'mb-2', 'p-3', 'border-0', 'border-lg-top', 'border-lg-right', 'border-lg-left', 'border-lg-bottom', 'rounded-1']).wait_until_present

    $browser.text_field(id: 'commit-summary-input').set(options['comment']) if options.has_key?('comment')
    $browser.textarea(id: 'commit-description-textarea').set(options['description']) if options.has_key?('description')

    $browser.button(id: 'submit-file').click

    condition = false
    aux =0
    until (condition or aux==100)
      condition = !$browser.button(id: 'submit-file').present?
      aux=aux+1
      sleep 0.2
    end
  end

  def updated?(file)
    $browser.refresh

    this_commit = $browser.span(text: 'Latest commit').parent.link.text

    return $last_commit != this_commit ?  true :  false

  end

end
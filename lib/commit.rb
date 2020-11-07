module CommitHelper
  extend self

  def commit(options)
    $browser.div(class: ['commit-form', 'position-relative', 'p-3', 'mb-2', 'border', 'rounded-1']).wait_until_present

    $browser.text_field(id: 'commit-summary-input').set(options['comment']) if options.has_key?('comment')
    $browser.textarea(id: 'commit-description-textarea').set(options['description']) if options.has_key?('description')

    $browser.button(class: ['btn', 'btn-primary', 'js-blob-submit']).click

  end
end
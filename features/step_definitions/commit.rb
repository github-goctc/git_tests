Given(/^I commit the file (upload|delete|edit)/) do |action, table|
  #FileHelper.commit_upload(table.hashes.first)
  FileHelper.send("commit_#{action}", table.hashes.first)
end
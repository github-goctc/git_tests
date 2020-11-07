Given(/^I open the repository "([^"]*)"/) do |repo|
  assert_equal(true, NavigationtHelper.goto_repo(repo))
end

Given(/^I switch to branch "([^"]*)"/) do |branch|
  assert_equal(true, NavigationtHelper.goto_branch(branch))
end

Given(/^I (upload|delete) the file "([^"]*)"/) do |action, file|
  #assert_equal(true, FileHelper.upload(file))
  assert_equal(true, FileHelper.send(action, file))
end

Given(/^The file "([^"]*)" is( not)? available in the repository/) do |file, type|
  if type
    assert_equal(false, FileHelper.goto_file(file))
  else
    assert_equal(true, FileHelper.goto_file(file))
  end
end

Given(/^I edit the file "([^"]*)"/) do |file, table|
  assert_equal(true, FileHelper.edit(file, table.hashes.first))
end
Given(/^The file "([^"]*)" was successfully updated/) do |file|
  assert_equal(true, FileHelper.updated?(file)  )
end

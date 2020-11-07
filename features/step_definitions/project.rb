Given(/^I (create|delete) the project$/) do |action, table|
  assert_equal(true, ProjectHelper.send(action, table.hashes.first))
end

Given(/^The project with the name "([^"]*)" was successfully created$/) do |project_name|
  assert_equal(true, ProjectHelper.goto_project(project_name))
end

Given(/^The project "([^"]*)" is (deleted)$/) do |project_name, status|
  assert_equal(true, ProjectHelper.send("is_#{status}?", project_name))
end
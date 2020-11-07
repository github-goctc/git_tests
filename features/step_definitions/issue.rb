Given(/^I (create|close|reopen) the issue$/) do |action, table|
  # assert_equal(true, IssueHelper.create(table.hashes.first))
  assert_equal(true, IssueHelper.send(action, table.hashes.first))
end

Given(/^The issue with the title "([^"]*)" was successfully created$/) do |issue_title|
  assert_equal(true, IssueHelper.goto_issue(issue_title))
end

Given(/^The issue "([^"]*)" is (closed|reopened)$/) do |issue_title, status|
  assert_equal(true, IssueHelper.send("is_#{status}?", issue_title))
end
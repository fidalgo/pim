# from https://github.com/tricycle/cucumber-steps

Then /^I should not see pagination$/ do
#  page.should_not have_tag("div.pagination")
page.should_not have_css('.pagination')
end

Then /^I should see pagination$/ do
  page.should have_css('.pagination')
end

Then /^I should see the first page of pagination$/ do
  page.should have_css('span.current', :text => '1')
end

Then /^I should see the second page of pagination$/ do
  page.should have_css('span.current', :text => '2')
end

Then /^I should see a link to the next page of pagination$/ do
page.should have_css('span.next')
end

Then /^I should see a link to the previous page of pagination$/ do
page.should have_css('span.prev')
end

When /^I click the next page link$/ do
  click_link 'Next'
end

Given /^we paginate after (\d+) (.*)$/ do |number, model_name|
  model = model_name.singularize.gsub(/[^A-z]+/, '_').camelize.constantize
  model.paginates_per number.to_i
end

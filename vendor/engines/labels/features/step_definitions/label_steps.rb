Given /^I have no labels$/ do
  Label.delete_all
end

Given /^I (only )?have labels titled "?([^\"]*)"?$/ do |only, titles|
  Label.delete_all if only
  titles.split(', ').each do |title|
    Label.create(:name => title)
  end
end

Then /^I should have ([0-9]+) labels?$/ do |count|
  Label.count.should == count.to_i
end

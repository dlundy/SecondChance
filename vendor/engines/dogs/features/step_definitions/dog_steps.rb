Given /^I have no dogs$/ do
  Dog.delete_all
end

Given /^I (only )?have dogs titled "?([^\"]*)"?$/ do |only, titles|
  Dog.delete_all if only
  titles.split(', ').each do |title|
    Dog.create(:title => title)
  end
end

Then /^I should have ([0-9]+) dogs?$/ do |count|
  Dog.count.should == count.to_i
end

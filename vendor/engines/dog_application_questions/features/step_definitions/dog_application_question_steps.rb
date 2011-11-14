Given /^I have no dog_application_questions$/ do
  DogApplicationQuestion.delete_all
end

Given /^I (only )?have dog_application_questions titled "?([^\"]*)"?$/ do |only, titles|
  DogApplicationQuestion.delete_all if only
  titles.split(', ').each do |title|
    DogApplicationQuestion.create(:question_text => title)
  end
end

Then /^I should have ([0-9]+) dog_application_questions?$/ do |count|
  DogApplicationQuestion.count.should == count.to_i
end

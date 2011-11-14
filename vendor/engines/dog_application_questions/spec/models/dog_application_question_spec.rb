require 'spec_helper'

describe DogApplicationQuestion do

  def reset_dog_application_question(options = {})
    @valid_attributes = {
      :id => 1,
      :question_text => "RSpec is great for testing too"
    }

    @dog_application_question.destroy! if @dog_application_question
    @dog_application_question = DogApplicationQuestion.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_dog_application_question
  end

  context "validations" do
    
    it "rejects empty question_text" do
      DogApplicationQuestion.new(@valid_attributes.merge(:question_text => "")).should_not be_valid
    end

    it "rejects non unique question_text" do
      # as one gets created before each spec by reset_dog_application_question
      DogApplicationQuestion.new(@valid_attributes).should_not be_valid
    end
    
  end

end
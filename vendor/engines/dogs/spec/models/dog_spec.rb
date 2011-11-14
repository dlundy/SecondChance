require 'spec_helper'

describe Dog do

  def reset_dog(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @dog.destroy! if @dog
    @dog = Dog.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_dog
  end

  context "validations" do
    
    it "rejects empty title" do
      Dog.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_dog
      Dog.new(@valid_attributes).should_not be_valid
    end
    
  end

end
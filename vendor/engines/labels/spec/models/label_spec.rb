require 'spec_helper'

describe Label do

  def reset_label(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @label.destroy! if @label
    @label = Label.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_label
  end

  context "validations" do
    
    it "rejects empty name" do
      Label.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_label
      Label.new(@valid_attributes).should_not be_valid
    end
    
  end

end
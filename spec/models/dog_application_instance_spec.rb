require 'spec_helper'

describe DogApplicationInstance do

  before(:each) do
    @attr = {
      :first_name => "Shinobi",
      :last_name => "Smith",
      :email => "shinobi@example.com"
      }
  end

  it "should create a new instance given valid attributes" do
     DogApplicationInstance.create!(@attr)
  end

  describe "validations" do
    pending
  end

  describe "application answer associations" do

    before(:each) do
      @dog_application_instance = DogApplicationInstance.create!(@attr)
    end

    it "should have an answers attribute" do
      pending
      #@dog_application_instance.should #respond_to(:dog_application_instance_answers)
    end

    it "should destroy associated answers" do
      pending
    end
  end
end

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

  describe "validations of required fields" do
    should_validate_presence_of :first_name
    should_validate_presence_of :last_name
  end

  describe "validations of field values" do
    should_validate_length_of :first_name, :within => 1..40
    should_validate_length_of :last_name, :within => 1..40
    should_allow_values_for :email, "jane@example.com","jane+blah@example.com"
    should_not_allow_values_for :email, "jane", "@foo", "whatever.com"
  end

  describe "application answer associations" do

    before(:each) do
      @dog_application_instance = DogApplicationInstance.create!(@attr)
    end

    it "should have an answers attribute" do
      @dog_application_instance.should respond_to(:dog_application_instance_answers)
    end

  end
end

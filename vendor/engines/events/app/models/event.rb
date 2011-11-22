class Event < ActiveRecord::Base

  acts_as_indexed :fields => [:geocords, :address_1, :address_2, :city, :state, :email, :website]

  validates :geocords, :presence => true, :uniqueness => true
  
end

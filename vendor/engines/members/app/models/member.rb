class Member < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :confirmable, :recoverable
  
  acts_as_indexed :fields => [:email, :first_name, :last_name, :address_1, :address_2, :city, :state, :phone, :description]

  validates :email, :presence => true, :uniqueness => true
  
  
end

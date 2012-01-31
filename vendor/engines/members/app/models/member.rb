class Member < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :confirmable, :recoverable
  
  acts_as_indexed :fields => [:email, :first_name, :last_name, :address_1, :address_2, :city, :state, :phone, :description]

  validates :email, :presence => true, :uniqueness => true
  
  has_many :event_members
  has_many :events, :through => :event_members
  has_many :dogs
  
  image_accessor :profile_image
  
  def attending_event?(event)
    event.members.include?(self)
  end
  
end

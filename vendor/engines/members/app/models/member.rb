class Member < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :confirmable, :recoverable
  
  acts_as_indexed :fields => [:email, :first_name, :last_name, :address_1, :address_2, :city, :state, :phone]

  validates :email, :presence => true, :uniqueness => true
  
  has_many :event_members
  has_many :events, :through => :event_members
  has_many :dogs
  
  image_accessor :profile_image
  
  def attending_event?(event)
    event.members.include?(self)
  end
  
  def available_dogs
    if dogs.present?
      dog_ids = dogs.map{|d| d.id}.join(',')
      Dog.active.where("id NOT IN (#{dog_ids})").order(:name)
    else
      Dog.active.order(:name)
    end
  end
  
end

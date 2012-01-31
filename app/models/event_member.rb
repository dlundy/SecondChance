class EventMember < ActiveRecord::Base
  
  belongs_to :event
  belongs_to :member
  
  has_many :event_member_dogs
  has_many :dogs, :through => :event_member_dogs
  
end

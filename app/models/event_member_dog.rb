class EventMemberDog < ActiveRecord::Base
  
  belongs_to :event_member
  belongs_to :dog
  
  validates :event_member_id, :dog_id, :presence => true
  validates :dog_id, :uniqueness => {:scope => :event_member_id} 
  
end

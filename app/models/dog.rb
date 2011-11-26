class Dog < ActiveRecord::Base
  
  belongs_to :member
  has_many :dog_photos
  
  validates :rescue_groups_id, :presence => true, :uniqueness => true
  attr_accessible :active, :age, :breed, :colors, :description, :name, :notes, :position, :rescue_groups_id, :member_id, :sex, :title, :weight, :weight_unit
  
  
end

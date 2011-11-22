class Dog < ActiveRecord::Base
  
  # has_many :dog_photos
  # belongs_to :member
  
  validates :rescue_groups_id, :presence => true, :uniqueness => true
  attr_accessible :active, :age, :breed, :colors, :description, :name, :notes, :position, :rescue_groups_id, :member_id, :sex, :title, :weight, :weight_unit
  
  def update_photos(photo_data)
    # TODO
  end
end

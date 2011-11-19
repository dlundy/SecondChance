class Dog < ActiveRecord::Base
  
  # refinery created the acts_as_index and validates methods that follow:
  acts_as_indexed :fields => [:title, :name, :breed, :sex, :weight_unit, :colors, :description, :notes]
  # validates :title, :presence => true, :uniqueness => true
  
  validates :rescue_groups_id, :presence => true, :uniqueness => true
  
  attr_accessible :active, :age, :breed, :colors, :description, :name, :notes, :position, :rescue_groups_id, :sex, :title, :weight, :weight_unit
  
end

class Dog < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :name, :breed, :sex, :weight_unit, :colors, :description, :notes]

  validates :title, :presence => true, :uniqueness => true
  
end

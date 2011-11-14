class Label < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :hex_code, :type]

  validates :name, :presence => true, :uniqueness => true
  
end

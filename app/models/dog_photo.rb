class DogPhoto < ActiveRecord::Base
  
  belongs_to :dog
  
  scope :thumbs, where(:size => 'thumb')
  scope :regulars, where(:size => 'regular')
  
end

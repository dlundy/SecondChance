class DogPhoto < ActiveRecord::Base

  belongs_to :dog
  image_accessor :image

  def primary?
    primary
  end

end

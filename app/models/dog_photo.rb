class DogPhoto < ActiveRecord::Base

  belongs_to :dog
  image_accessor :image

  def primary?
    rescue_groups_key =~ /1/
  end

end

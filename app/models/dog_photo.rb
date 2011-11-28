class DogPhoto < ActiveRecord::Base
  
  belongs_to :dog
  
  scope :thumbs, where(:size => 'thumb')
  scope :regulars, where(:size => 'regular')
  
  def primary?
    primary
  end
  
  def get_full_photo
    return nil unless size == 'thumb'
    rgo_key_number = rescue_groups_key.gsub(/\D/, '')
    dog.dog_photos.regulars.where(["rescue_groups_key LIKE ?", "%#{rgo_key_number}"]).first
  end
  
end

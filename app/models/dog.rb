class Dog < ActiveRecord::Base
  
  belongs_to :member
  has_many :dog_photos
  
  validates :rescue_groups_id, :presence => true, :uniqueness => true
  attr_accessible :active, :age, :breed, :colors, :description, :name, :notes, :position, :rescue_groups_id, :member_id, :sex, :title, :weight, :weight_unit
  
  scope :active, where(:active => true)
  
  # TODO: we should use something like SOLR, but for now, this will work
  def self.search(text)
    text = text.downcase
    active.where(["name ILIKE ? OR breed ILIKE ?", "%#{text}%", "%#{text}%"])
  end

  # dlundy - little hack to temporarily titleize the names
  def name
    read_attribute(:name).titleize
  end

  def short_description
    read_attribute(:description).truncate(160)
  end

  def primary_photo
    dog_photos.regulars.order(:ordinal).first
  end

  def primary_thumb_url
    thumb = dog_photos.thumbs.where("dog_photos.url is not null").order(:ordinal).first
    thumb ? thumb.url : nil
  end

end

class Dog < ActiveRecord::Base
  
  belongs_to :member
  has_many :dog_photos
  
  validates :rescue_groups_id, :presence => true, :uniqueness => true
  attr_accessible :active, :age, :breed, :colors, :description, :name, :notes, :position, :rescue_groups_id, :member_id, :sex, :title, :weight, :weight_unit
  
  
  # TODO: we should use something like SOLR, but for now, this will work
  def self.search(text)
    text = text.downcase
    where(["name ILIKE ? OR breed ILIKE ?", "%#{text}%", "%#{text}%"])
  end

  # dlundy - little hack to temporarily titleize the names
  def name
    read_attribute(:name).titleize
  end

  # quick proof of concept for stripping style attrs from description using nokogiri
  def description
    raw = read_attribute(:description)
    parsed = Nokogiri::HTML(raw)
    parsed.xpath('//@style').each(&:remove)
    parsed.xpath('//br').each(&:remove)
    parsed.xpath('//img').each(&:remove)
    parsed.xpath('//object').each(&:remove)
    parsed
  end

  def short_description
    read_attribute(:description).truncate(160)
  end

  def primary_photo
    dog_photos.regulars.where(:primary => true).first || dog_photos.regulars.order('created_at').first
  end

  def primary_thumb_url
    thumb = dog_photos.thumbs.where("dog_photos.url is not null").first
    thumb ? thumb.url : nil
  end

end

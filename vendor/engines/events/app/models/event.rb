class Event < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :address_1, :address_2, :city, :state, :email, :website]

  validates :lat, :lng, :title, :member_limit, :dog_limit, :presence => true
  validates :member_limit, :dog_limit, :numericality => true
  
  before_validation :find_gmap_coords
  
  has_many :event_members, :dependent => :destroy
  has_many :members, :through => :event_members 
  has_and_belongs_to_many :dogs
  
  scope :upcoming, where("end_at > '#{Time.zone.now}'")
  
  image_accessor :main_image
   
  GOOGLE_GEOCODE_URI = 'http://maps.googleapis.com/maps/api/geocode/json?address='
  HOUR_RSVP_LIMIT = 12
   
  # http://code.google.com/apis/maps/documentation/geocoding/index.html
  def find_gmap_coords
    map_sensitive_atts = ["address_1", "address_2", "city", "state", "zipcode"]
    sensitive_atts_to_update = @changed_attributes.keys & map_sensitive_atts
    return unless (sensitive_atts_to_update.size > 0)
    gmap_address = [address_1, address_2, city, state, zipcode].join(' ')
    gmap_uri = URI.parse(GOOGLE_GEOCODE_URI + URI.encode(gmap_address) + '&sensor=false')
    json_result = Net::HTTP.get(gmap_uri)
    gmap_lat, gmap_lng = parse_gmap_lat_and_lng(json_result)
    self.lat = gmap_lat
    self.lng = gmap_lng
  end
  
  # def dogs
  #   event_member_dogs.select('dogs.id as dog_id, dogs.name as dog_name').joins('INNER JOIN dogs ON dogs.id = event_member_dogs.dog_id').all +
  #   non_member_dogs.select('dogs.id as_dog_id, dogs.name as dog_name').all
  # end
  
  def available_dogs
    return Dog.active if dogs.empty?
    Dog.active.where("id NOT IN (#{dogs.map{|d| d['id']}.join(',')})")
  end
  
  def at_member_capacity?
    event_members.size == member_limit
  end
  
  def at_dog_capacity?
    dogs.size == dog_limit
  end
  
  private
  
  def parse_gmap_lat_and_lng(json_string)
    json_res = JSON(json_string)
    location = json_res["results"][0]["geometry"]["location"]
    [location["lat"], location["lng"]]
  end
  
end

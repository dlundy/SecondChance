class RescueGroupsDotOrgClient 
  include HTTParty
  
  base_uri 'http://api.rescuegroups.org/rest/'
  format :xml
  default_params :key => ENV['RG_ORG_KEY'], :orgID => ENV['RG_ORG_ID']
    
  def self.get_sc_dogs(limit=DOG_IMPORT_LIMIT, opts={})
    updated_after = opts[:updated_after].present? ? opts[:updated_after] : nil
    res = get('/', :query => {:type => 'animals', :limit => limit, :updatedAfter => updated_after})    
    if res.code == 200 
      dogs = res.parsed_response['pets']['pet']
      if dogs.present?
        dogs.each do |dog|
          next if dog.nil?
          dog_data = massage_data(dog)
          if sc_dog = Dog.find_by_rescue_groups_id(dog_data['animalID'])
            sc_dog.update_attributes(dog_data)
            update_photos!(sc_dog, get_photo_data(dog_data))
          else
            dog_data.merge!({:rescue_groups_id => dog_data['animalID']})
            sc_dog = Dog.new(dog_data)
            set_photos!(sc_dog, get_photo_data(dog_data))
            sc_dog.save
          end
        end 
        RescueGroupsPull.create({:dog_count => dogs.size})
      end
      return true
    else
      return false
    end
  end
  
  private
  
  def self.massage_data(dog)
    dog['name'] = dog['name'].downcase # let's store our dog names in lowercase
    dog['breed'] = CGI.unescapeHTML(dog['breed'])
    puts dog['description']
    parsed = Nokogiri::HTML(dog['description'])
    parsed.xpath('//@style').each(&:remove)
    parsed.xpath('//br').each(&:remove)
    parsed.xpath('//img').each(&:remove)
    parsed.xpath('//object').each(&:remove)
    inner_html = parsed.inner_html
    # we want to remove the html and body tags.  a bit hacky, but it will do for now...
    dog['description'] = inner_html.sub('<html>', '').sub('<body>', '').sub('</body>', '').sub('</html>', '')    
    dog['description'] = CGI.unescapeHTML(dog['description'])
    dog
  end
  
  def self.get_photo_data(dog_data)
    dog_data.select{|k,v| k.to_s =~ /pic/}
  end
  
  def self.set_photos!(dog, photo_data)
    return unless dog.dog_photos.empty?
    photo_data.each do |key, value|
      size = (key.to_s =~ /tmn/ ? 'thumb' : 'regular')
      dog.dog_photos << DogPhoto.new({:rescue_groups_key => key.to_s, :url => value, :size => size})
    end
  end
  
  def self.update_photos!(dog, photo_data)
    photo_data.each do |key, value|
      dog.dog_photos.where(:rescue_groups_key => key.to_s).first.update_attribute(:url, value)
    end
  end
  
end


# require 'rescue_groups_dot_org_client'
# class UpdateScDbJob < Struct.new(:limit, :opts)
#   
#   @@limit ||= DOG_IMPORT_LIMIT
#   
#   # NOTE: We may or may not want to strip the footer.  We can replace it with our own CMS-controlled footer.
#   # FOOTER_REGEX = /All of our dogs are in private volunteer foster homes.*$/
#   
#   
#   def perform
#     dogs = RescueGroupsDotOrgClient.get_sc_dogs(@@limit)
#     if dogs.present?
#       dogs.each do |dog|
#         dog_data = massage_data(dog)
#         if sc_dog = Dog.find_by_rescue_groups_id(dog_data['animalID'])
#           sc_dog.update_attributes(dog_data)
#           update_photos!(sc_dog, get_photo_data(dog_data))
#         else
#           dog_data.merge!({:rescue_groups_id => dog_data['animalID']})
#           sc_dog = Dog.new(dog_data)
#           set_photos!(sc_dog, get_photo_data(dog_data))
#           sc_dog.save
#         end
#       end 
#       RescueGroupsPull.create({:dog_count => dogs.size})
#     end
#   end
# 
#   protected
# 
#   def massage_data(dog)
#     dog['name'] = dog['name'].downcase # let's store our dog names in lowercase
#     dog['breed'] = CGI.unescapeHTML(dog['breed'])
#     puts dog['description']
#     parsed = Nokogiri::HTML(dog['description'])
#     parsed.xpath('//@style').each(&:remove)
#     parsed.xpath('//br').each(&:remove)
#     parsed.xpath('//img').each(&:remove)
#     parsed.xpath('//object').each(&:remove)
#     inner_html = parsed.inner_html
#     # we want to remove the html and body tags.  a bit hacky, but it will do for now...
#     dog['description'] = inner_html.sub('<html>', '').sub('<body>', '').sub('</body>', '').sub('</html>', '')    
#     dog['description'] = CGI.unescapeHTML(dog['description'])
#     dog
#   end
# 
#   def get_photo_data(dog_data)
#     dog_data.select{|k,v| k.to_s =~ /pic/}
#   end
# 
#   def set_photos!(dog, photo_data)
#     return unless dog.dog_photos.empty?
#     photo_data.each do |key, value|
#       size = (key.to_s =~ /tmn/ ? 'thumb' : 'regular')
#       dog.dog_photos << DogPhoto.new({:rescue_groups_key => key.to_s, :url => value, :size => size})
#     end
#   end
# 
#   def update_photos!(dog, photo_data)
#     photo_data.each do |key, value|
#       dog.dog_photos.where(:rescue_groups_key => key.to_s).first.update_attribute(:url, value)
#     end
#   end
# 
# end


# EXAMPLE RESPONSE:
# ruby-1.9.2-p0 >   x = RescueGroupsDotOrgClient.get_sc_dogs(2).parsed_response
# {
#   "pets"=>
#   {
#     "parameters"=>
#     {
#       "type"=>"animals", 
      #   "updatedAfter"=>nil, 
      #   "orgID"=>"2802", 
      #   "species"=>"Dog,Cat", 
      #   "status"=>"Available", 
      #   "limit"=>"2", 
      #   "startPage"=>nil, 
      #   "currentTime"=>"1321672324", 
      #   "foundRows"=>"166"
      # }, 
      # "recordCount"=>"2",
      # "pet" => [] # Array pets data.  Each pet is a hash.  Here are the keys:
      # SORTED ALPHABETICALLY:
      # activityLevel
      # affectionate
      # age
      # altered
      # animalID
      # apartment
      # breed
      # cats
      # coatLength
      # color
      # contactCellPhone
      # contactEmail
      # contactHomePhone
      # contactName
      # courtesy
      # cratetrained
      # declawed
      # description
      # description
      # dogs
      # drools
      # eagerToPlease
      # earType
      # energyLevel
      # escapes
      # eventempered
      # exerciseNeeds
      # eyeColor
      # fence
      # fetches
      # found
      # foundDate
      # foundZipcode
      # gentle
      # goodInCar
      # goofy
      # groomingNeeds
      # hasAllergies
      # hearingImpaired
      # housetrained
      # hypoallergenic
      # independent
      # intelligent
      # kids
      # killDate
      # killReason
      # lap
      # lastUpdated
      # leashtrained
      # locationZipcode
      # mixed
      # name
      # newPeople
      # noCold
      # noFemaleDogs
      # noHeat
      # noLargeDogs
      # noMaleDogs
      # noSmallDogs
      # oKForSeniors
      # oKWithAdults
      # oKWithLivestock
      # obedienceTraining
      # obedient
      # olderKidsOnly
      # ongoingMedical
      # orgID
      # ownerExperience
      # pattern
      # petUrl
      # pic1
      # pic2
      # pic3
      # pic4
      # pictmn1
      # pictmn2
      # pictmn3
      # pictmn4
      # playful
      # playsToys
      # predatory
      # primaryBreed
      # protective
      # rescueID
      # secondaryBreed
      # sex
      # shedding
      # sightImpaired
      # size
      # skidish
      # specialDiet
      # specialNeeds
      # species
      # status
      # summary
      # swims
      # tailType
      # timid
      # uptodate
      # video1
      # videoUrl1
      # vocal
      # yardRequired

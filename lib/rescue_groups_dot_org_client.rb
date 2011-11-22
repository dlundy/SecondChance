class RescueGroupsDotOrgClient 
  include HTTParty
  
  base_uri 'http://api.rescuegroups.org/rest/'
  format :xml
  default_params :key => 'oeBe46yG', :orgID => 2802 # TODO: move to config file
    
  def self.get_sc_dogs(limit=200, opts={})
    res = get('/', :query => {:type => 'animals', :limit => limit})
    if res.code == 200 
      dogs = res.parsed_response['pets']['pet']
      RescueGroupsPull.create({:dog_count => dogs.size})
      dogs
    end
  end
  
  
end


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

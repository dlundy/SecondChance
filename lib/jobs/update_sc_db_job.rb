require 'rescue_groups_dot_org_client'
class UpdateScDbJob < Struct.new(:limit)
  
  @@limit ||= 200
  
  def perform
    dogs = RescueGroupsDotOrgClient.get_sc_dogs(@@limit)
    dogs.each do |dog|
      dog = remove_lame_atts!(dog)
      if sc_dog = Dog.find_by_rescue_groups_id(dog['animalID'])
        # TODO: this performs like crap!
        sc_dog.update_attributes(dog) if needs_update?(dog)
        sc_dog.update_photos(get_photo_data(dog)) if new_photos?
      else
        process_dup!(dog) if test_for_dup?(dog)
        dog.merge!({:rescue_groups_id => dog['animalID']})
        Dog.create(dog)
      end
    end
  end
  
  private
  
  def test_for_dup?(dog)
    # TODO
  end
  
  def process_dup!(dog)
    # TODO
  end
  
  def needs_update?(dog)
    # TODO
  end
  
  def new_photos?
    # TODO
  end
  
  def get_photo_data
    # TODO
  end
  
  def remove_lame_atts!(dog)
    dog.delete('age') # rescuegroups.org uses a string like "old" or "young" instead of decimal or integer
    dog['name'] = dog['name'].downcase # let's store our dog names in lowercase
    dog
  end
  
end
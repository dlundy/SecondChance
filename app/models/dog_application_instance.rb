class DogApplicationInstance < ActiveRecord::Base

  has_many :dog_application_instance_answers, :dependent => :destroy

end

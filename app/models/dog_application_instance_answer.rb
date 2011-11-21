class DogApplicationInstanceAnswer < ActiveRecord::Base

  belongs_to :dog_application_instance

  validates :dog_application_instance_id, :presence => true

end

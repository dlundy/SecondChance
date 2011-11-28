class DogApplicationInstanceAnswer < ActiveRecord::Base

  belongs_to :dog_application_instance
  belongs_to :dog_application_question

end

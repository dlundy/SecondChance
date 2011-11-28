class DogApplicationQuestion < ActiveRecord::Base

  has_many :dog_application_instance_answers, :dependent => :destroy
  acts_as_indexed :fields => [:question_text]

  validates :question_text, :presence => true, :uniqueness => true

end

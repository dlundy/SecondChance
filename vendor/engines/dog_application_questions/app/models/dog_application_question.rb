class DogApplicationQuestion < ActiveRecord::Base

  acts_as_indexed :fields => [:question_text]

  validates :question_text, :presence => true, :uniqueness => true
  
end

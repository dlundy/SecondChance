class DogApplicationInstance < ActiveRecord::Base

  has_many :dog_application_instance_answers, :dependent => :destroy

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, :presence =>true,
                         :length => { :maximum => 40 }
  validates :last_name, :presence =>true,
                        :length => { :maximum => 40 }
  validates :email, :format =>  { :with => email_regex,
                                  :message => "Please enter a valid email address" }

end

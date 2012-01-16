class LoginController < Devise::SessionsController
  
  layout 'application'
  
  private
  
  def after_sign_in_path_for(member)
    root_path
  end
    

end

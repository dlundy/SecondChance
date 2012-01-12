class LoginController < Devise::SessionsController
  
  private
  
  def after_sign_in_path_for(member)
    root_path
  end
    

end

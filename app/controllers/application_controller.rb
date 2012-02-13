class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def default_url_options
    {:host => ENV['SC_HOSTNAME']}
  end
  
  protected
  
  def dpage
    params[:page] || 1
  end
  
  def members_only
    unless current_member
      flash[:error] = 'You must sign in'
      redirect_to root_path
      return
    end
  end
  
   
end

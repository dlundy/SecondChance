class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
  
  def dpage
    params[:page] || 1
  end
   
end

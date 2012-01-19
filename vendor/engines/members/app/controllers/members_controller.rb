class MembersController < ApplicationController
  
  respond_to :html
  
  before_filter :members_only
  
  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @member in the line below:
    @members = Member.order(:last_name)
  end

  def show
    @member = Member.find(params[:id])
    respond_with @member
  end

  def edit
    @member = Member.find(params[:id])
  end
  
  def update
    @member = Member.find(params[:id])
    @member.update_attributes(params[:member])
    respond_with @member
  end
    
end

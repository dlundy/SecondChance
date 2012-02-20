module Admin
  class MembersController < Admin::BaseController

    crudify :member, :title_attribute => 'email', :xhr_paging => true
    
    def confirm
      member = Member.find(params[:id])
      if member.update_attribute(:confirmed_at, Time.zone.now)
        render :json => {:result => 'success'}
      else
        render :json => {:result => 'fail'}
      end
    end
    
    def block
      member = Member.find(params[:id])
      if member.update_attribute(:confirmed_at, nil)
        render :json => {:result => 'success'}
      else
        render :json => {:result => 'fail'}
      end
    end
    
    def add_dog
      member = Member.find(params[:id])
      dog = Dog.find(params[:dog_id])
      member.dogs << dog
      flash[:notice] = "#{dog.name.capitalize} has been placed with this volunteer"
      redirect_to edit_admin_member_path(@member)
    end
    
    def remove_dog
      member = Member.find(params[:id])
      dog = Dog.find(params[:dog_id])
      member.dogs.delete(dog)
      flash[:notice] = "#{dog.name.capitalize} has been removed from this volunteer"
      redirect_to edit_admin_member_path(@member)
    end
    
  end
end

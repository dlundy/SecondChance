module Admin
  class MembersController < Admin::BaseController

    crudify :member, :title_attribute => 'email', :xhr_paging => true
    
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

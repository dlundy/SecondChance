class EventMembersController < ApplicationController
  
  before_filter :find_event_member
    
  
  def show
    respond_to do |format|
      dogs_to_display = @event_member.member.dogs - @event_member.dogs 
      format.json {render :json => dogs_to_display}
    end
  end
  
  def add_dog
    new_dog = Dog.find(params[:dog_id])
    @event_member.dogs << new_dog
    all_dogs = (@event_member.dogs.size == @event_member.member.dogs.size)
    respond_to do |format|
      format.json {render :json => {:dogs => @event_member.dogs, :all_dogs => all_dogs}}
    end
  end
  
  def remove_dog
    @event_member.reload if EventMemberDog.delete(params[:event_member_dog_id])
    respond_to do |format|
      format.json {render :json => @event_member.dogs}
    end
  end
  
  private
  
  def find_event_member
    @event_member = EventMember.find(params[:id])
  end
  
end
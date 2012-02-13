class EventMembersController < ApplicationController
  
  before_filter :find_event_member
    
  
  # def show
  #   respond_to do |format|
  #     dogs_to_display = @event_member.member.dogs - @event_member.dogs 
  #     format.json {render :json => dogs_to_display}
  #   end
  # end
  
  def add_dog
    new_dog = Dog.find(params[:dog_id])
    if @event_member.dogs << new_dog
      flash[:notice] = "#{new_dog.name} has been added to the event"
    else
      flash[:error] = "There was a problem adding #{dog.name} to the event"
    end
    redirect_to event_path(@event_member.event)
  end
  
  def remove_dog
    dog = EventMemberDog.find(params[:em_dog_id]).dog
    if EventMemberDog.delete(params[:em_dog_id])    
      flash[:notice] = "#{dog.name} has been removed from the event"
    else
      flash[:error] = "There was a problem removing #{dog.name} from the event"
    end
    redirect_to event_path(@event_member.event)
  end
  
  private
  
  def find_event_member
    @event_member = EventMember.find(params[:id])
  end
  
end
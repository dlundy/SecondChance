class EventsController < ApplicationController

  before_filter :find_page
  before_filter :members_only, :only => [:rsvp, :cancel_rsvp]

  def index
    @events = Event.upcoming.order('start_at ASC')
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @event in the line below:
    present(@page)
  end

  def show
    @event = Event.find(params[:id])
    @dogs_to_display = current_member.dogs - @event.dogs if current_member
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @event in the line below:
    present(@page)
  end
  
  def rsvp
    event = Event.find(params[:id])
    res = event.members << current_member
    if res.present?
      flash[:notice] = "You have RSVP'd for #{event.title}.  See you there!"
    else
      flash[:error] = "There was an error RSVP-ing for the event.  Sorry!"
    end
    # TODO: email confirmation ?  
    redirect_to event_path(event)
  end
  
  def cancel_rsvp
    event = Event.find(params[:id])
    res = event.members.delete(current_member)
    if res.present?
      flash[:notice] = "Your RSVP for #{event.title} has been canceled."
    else
      flash[:error] = "There was an error canceling your RSVP.  Sorry!"
    end
    redirect_to event_path(event)
  end
  
  def add_dog
    event = Event.find(params[:id])
    dog = Dog.find(params[:dog_id])
    if event.dogs << dog 
      flash[:notice] = "#{dog.name} has been added to the event"
    else
      flash[:error] = "There was a problem adding #{dog.name} to the event"
    end
    redirect_to event_path(event)
  end
  
  def remove_dog
    event = Event.find(params[:id])
    dog = Dog.find(params[:id])
    if event.dogs.delete(dog)
      flash[:notice] = "#{dog.name} was removed from the event"
    else
      flash[:error] = "There was a problem removing #{dog.name} from the event"
    end
    redirect_to event_path(event)
  end
  
  
  
    
  protected

  def find_page
    @page = Page.where(:link_url => "/events").first
  end
  
end

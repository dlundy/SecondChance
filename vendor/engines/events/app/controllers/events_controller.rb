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
    @event_member = current_member.event_members.where(:event_id => @event.id).first
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
    
  protected

  def find_page
    @page = Page.where(:link_url => "/events").first
  end
  
end

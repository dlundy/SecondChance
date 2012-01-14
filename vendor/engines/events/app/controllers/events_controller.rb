class EventsController < ApplicationController

  before_filter :find_all_events
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @event in the line below:
    present(@page)
  end

  def show
    @event = Event.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @event in the line below:
    present(@page)
  end
  
  def rsvp
    event = Event.find(params[:id])
    res = event.event_members << Member.find(params[:member_id])
    if res.present?
      flash[:notice] = "You have RSVP'd for #{event.title}.  See you there!"
    else
      flash[:error] = "There was an error RSVP-ing for the event.  Sorry!"
    end
    # TODO: email confirmation ?  
    redirect_to events_path(event)
  end

protected

  def find_all_events
    @events = Event.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/events").first
  end

end

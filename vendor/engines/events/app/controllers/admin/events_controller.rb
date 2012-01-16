module Admin
  class EventsController < Admin::BaseController

    crudify :event, :title_attribute => 'title', :order => 'start_at DESC', :xhr_paging => true
    
  end
end

module Admin
  class EventsController < Admin::BaseController

    crudify :event, :title_attribute => 'title', :xhr_paging => true
    
  end
end

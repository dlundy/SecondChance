module Admin
  class EventsController < Admin::BaseController

    crudify :event,
            :title_attribute => 'geocords', :xhr_paging => true

  end
end

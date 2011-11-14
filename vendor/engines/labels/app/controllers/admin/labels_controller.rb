module Admin
  class LabelsController < Admin::BaseController

    crudify :label,
            :title_attribute => 'name', :xhr_paging => true

  end
end

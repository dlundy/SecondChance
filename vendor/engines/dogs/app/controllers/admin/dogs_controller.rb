module Admin
  class DogsController < Admin::BaseController

    crudify :dog, :xhr_paging => true

  end
end

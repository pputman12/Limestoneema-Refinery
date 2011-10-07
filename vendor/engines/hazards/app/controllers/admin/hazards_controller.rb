module Admin
  class HazardsController < Admin::BaseController

    crudify :hazard, :xhr_paging => true

  end
end

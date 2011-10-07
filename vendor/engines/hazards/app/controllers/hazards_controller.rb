class HazardsController < ApplicationController

  before_filter :find_all_hazards
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @hazard in the line below:
    present(@page)
  end

  def show
    @hazard = Hazard.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @hazard in the line below:
    present(@page)
  end

protected

  def find_all_hazards
    @hazards = Hazard.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/hazards").first
  end

end

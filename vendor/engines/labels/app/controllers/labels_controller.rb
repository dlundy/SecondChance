class LabelsController < ApplicationController

  before_filter :find_all_labels
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @label in the line below:
    present(@page)
  end

  def show
    @label = Label.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @label in the line below:
    present(@page)
  end

protected

  def find_all_labels
    @labels = Label.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/labels").first
  end

end

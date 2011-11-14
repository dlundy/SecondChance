class DogsController < ApplicationController

  before_filter :find_all_dogs
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @dog in the line below:
    present(@page)
  end

  def show
    @dog = Dog.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @dog in the line below:
    present(@page)
  end

protected

  def find_all_dogs
    @dogs = Dog.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/dogs").first
  end

end

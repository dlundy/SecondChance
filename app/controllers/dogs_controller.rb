require 'rescue_groups_dot_org_client'
class DogsController < ApplicationController

  def index
    dogs_per_page = Rails.application.config.dogs_per_page
    if params[:search_text].present?
      @dogs = Dog.active.search(params[:search_text].downcase).paginate({:page => dpage, :per_page => dogs_per_page})
    else
      @dogs = Dog.active.paginate({:page => dpage, :per_page => dogs_per_page})
    end
    if @dogs.out_of_bounds?
      raise ActionController::RoutingError.new('Not Found')
    end
  
    respond_to do |format|
      format.json do
        render :json => {
          :dogs => @dogs.as_json({
            :only => [:id, :name, :colors, :breed, :age, :sex],
            :methods => [:short_description, :primary_thumb_url]
          }),
          :pages => @dogs.total_pages,
          :results => @dogs.total_entries
        }
      end
    end
  
  end

  def show
    @dog = Dog.find params[:id]
  end

  def import_dog_data
    # NOTE:  It's more expensive to run background jobs on Heroku.  On average this import only takes a few seconds.
    #        So, let's try it without a background job first.
    # Delayed::Job.enqueue(UpdateScDbJob.new(DOG_IMPORT_LIMIT))
    # flash[:notice] = 'Importing Dog Data from RescueGroups.org.  Please be patient, this make take a few moments.'
    if RescueGroupsDotOrgClient.get_sc_dogs
      message = 'Dog data has been imported!'
    else
      message = 'There was a problem importing the dog data'
    end
    respond_to do |format|
      format.json {render :json => {:message => message}}
    end
  end
  
end


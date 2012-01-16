class DogsController < ApplicationController

  def index
    dogs_per_page = Rails.application.config.dogs_per_page
    if params[:search_text].present?
      @dogs = Dog.search(params[:search_text].downcase).paginate({:page => dpage, :per_page => dogs_per_page})
    else
      @dogs = Dog.paginate({:page => dpage, :per_page => dogs_per_page})
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
    Delayed::Job.enqueue(UpdateScDbJob.new(DOG_IMPORT_LIMIT))
    flash[:notice] = 'Importing Dog Data from RescueGroups.org.  Please be patient, this make take a few moments.'
    redirect_to :back
  end

end


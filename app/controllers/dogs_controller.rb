class DogsController < ApplicationController

  def index
    if params[:search_text].present? 
      @dogs = Dog.search(params[:search_text].downcase).paginate({:page => dpage, :per_page => 12})
    else  
      @dogs = Dog.paginate({:page => dpage, :per_page => 12})
    end
    if @dogs.out_of_bounds?
      raise ActionController::RoutingError.new('Not Found')
    end
  
    respond_to do |format|
      format.json do
        render :json => @dogs.as_json({
          :only => [:id, :name, :colors, :breed, :age, :sex],
          :methods => [:short_description, :primary_thumb_url]
        })
      end
    end
  
  end

  def show
    @dog = Dog.find params[:id]

    respond_to do |format|
      format.html
      format.json do
        render :json => @dog.as_json({
          :only => [:id, :name, :colors, :breed, :age, :sex],
          :methods => [:short_description, :primary_thumb_url]
        })
      end
    end

  end

end

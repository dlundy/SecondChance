class DogsController < ApplicationController

  def index
    @dogs = Dog.paginate({:page => dpage, :per_page => 12})
    if @dogs.out_of_bounds?
      raise ActionController::RoutingError.new('Not Found')
    end

    respond_to do |format|
      format.json do
        render :json => @dogs.as_json({
          :only => [:name, :colors, :breed, :age, :sex],
          :methods => :short_description
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
          :only => [:name, :colors, :breed, :age, :sex],
          :methods => :short_description
        })
      end
    end

  end

end

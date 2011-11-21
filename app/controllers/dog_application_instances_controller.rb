class DogApplicationInstancesController < ApplicationController
  # GET /dog_application_instances/new
  # GET /dog_application_instances/new.xml
  def new
    @dog_application_instance = DogApplicationInstance.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
  end
end

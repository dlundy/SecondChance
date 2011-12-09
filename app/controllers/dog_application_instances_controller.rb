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
    @dog_application_instance = DogApplicationInstance.new(params[:dog_application_instance])
    params.each do |key, value|
      next unless md = key.match(/^question_(\d){1,2}$/)
      q_id = md[1].to_i
      @dog_application_instance.dog_application_instance_answers << DogApplicationInstanceAnswer.new({:dog_application_question_id => q_id, :answer => value})
    end
    respond_to do |format|
      format.html do
        if @dog_application_instance.save 
          flash[:notice] = "Thanks for applying!  We will be in touch soon."
          redirect_to root_path
        else 
          render :action => :new
        end
      end
    end
  end
  
  
end

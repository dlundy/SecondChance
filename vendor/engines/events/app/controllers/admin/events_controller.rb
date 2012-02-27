module Admin
  class EventsController < Admin::BaseController

    crudify :event, :title_attribute => 'title', :order => 'start_at DESC', :xhr_paging => true
    
    
    ## TODO: make the dog adding and removing AJAX requests so they admin does not have to suffer 
    ##       through page refreshes when adding / removing many dogs.
    
    def add_dog
      event = Event.find(params[:id])
      dog = Dog.find(params[:dog_id])
      if event.dogs << dog 
        flash[:notice] = "#{dog.name} has been added to the event"
      else
        flash[:error] = "There was a problem adding #{dog.name} to the event"
      end
      redirect_to edit_admin_event_path(event) + '#current_dogs'
    end

    def remove_dog
      event = Event.find(params[:id])
      dog = Dog.find(params[:dog_id])
      if event.dogs.delete(dog)
        flash[:notice] = "#{dog.name} was removed from the event"
      else
        flash[:error] = "There was a problem removing #{dog.name} from the event"
      end
      redirect_to edit_admin_event_path(event) + '#current_dogs'
    end
            
  end
end

::Refinery::Application.routes.draw do
  resources :events, :only => [:index, :show] do
    member do
      post :rsvp
      post :cancel_rsvp
      post :add_dog
      post :remove_dog
    end
  end

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :events, :except => :show do
      member do 
        post :add_dog
        post :remove_dog
      end
      collection do
        post :update_positions
      end
    end
  end
end

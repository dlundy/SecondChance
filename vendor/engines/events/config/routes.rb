::Refinery::Application.routes.draw do
  resources :events, :only => [:index, :show] do
    member do
      post :rsvp
      post :cancel_rsvp
    end
  end

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :events, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end

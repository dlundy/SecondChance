::Refinery::Application.routes.draw do
  resources :labels, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :labels, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end

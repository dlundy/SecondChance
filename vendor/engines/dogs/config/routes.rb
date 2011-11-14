::Refinery::Application.routes.draw do
  resources :dogs, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :dogs, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end

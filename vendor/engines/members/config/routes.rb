::Refinery::Application.routes.draw do
  resources :members  

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :members, :except => :show do
      member do
        post :confirm
        post :block
        post :add_dog
        post :remove_dog
      end
      collection do
        post :update_positions
      end
    end
  end
end

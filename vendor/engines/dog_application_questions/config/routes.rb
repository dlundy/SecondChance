::Refinery::Application.routes.draw do
  resources :dog_application_questions, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :dog_application_questions, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end

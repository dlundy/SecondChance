SecondChance::Application.routes.draw do
  
  # NOTE: We are using different controller names for our members resource.  "sessions" and "registrations" are being used by 
  # the refinerycms user resource.  We are using the members resource to track our non-cms users - the foster and volunteer people 
  # who will use the website.  The routes for the user resource happen auto-magically via the refinerycms gem.
  devise_for :members, :controllers => { :sessions => "login", :registrations => "signup" }

  resources :dog_photos
  resources :dogs do
    collection { post :import_dog_data }
  end
    
  # match '/adoption_application' => 'dog_application_instances#new'
  # resources :dog_application_instances

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

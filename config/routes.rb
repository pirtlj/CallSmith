CallSmith::Application.routes.draw do
  

  resources :contacts do 
    resources :contact_notes
  end
  
  resources :contact_notes

  resources :list_contacts do
    member do
      get :dial
      post:dial
      
      post :handle_dial
      get :handle_dial
    end
  end

  resources :lists do
    resources :list_contacts
    
    member do
      post :connect
      post :next
      post :cancel
      
      post :handle_connect
      get :handle_connect
    end
  end

  resources :calls do
    collection do
      get :start
      post :start
      
      get :next
      
      get :handle
      post :handle
    end
    
    member do
      get :dial
      post:dial
      get :handle
    end
  end

  match 'instructions', :to => 'home#instructions'

  match 'home', :to => 'home#home'
  root :to => "home#home"

  devise_for :users
  resources :users, :only => [:show, :update] do
    member do
      get :bookmarklet
    end
    
    resources :contacts
  end

  


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

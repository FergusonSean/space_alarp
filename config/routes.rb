SpaceAlarp::Application.routes.draw do
  
  resources :ships, :only => [:new, :show, :create]

  resources :rooms, :only => [:show] do
    member do
      post :push_button
    end
  end
  # the priority is based upon order of creation:
  # first created -> highest priority.

  # sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # keep in mind you can assign values other than :controller and :action

  # sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # this route can be invoked with purchase_url(:id => product.id)

  # sample resource route (maps http verbs to controller actions automatically):
  #   resources :products

  # sample resource route with options:
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

  # sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # sample resource route within a namespace:
  #   namespace :admin do
  #     # directs /admin/products/* to admin::productscontroller
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # you can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'ships#new'

  # see how all your routes lay out with "rake routes"

  # this is a legacy wild controller route that's not recommended for restful applications.
  # note: this route will make all actions in every controller accessible via get requests.
  # match ':controller(/:action(/:id))(.:format)'
end

SpaceAlarp::Application.routes.draw do

  resources :ships, :only => [:new, :show, :create] do
    collection do
      post :join
    end
    member do
      post :start_mission
    end
  end

  match "/:id/:location" => "rooms#show", :as => :room
  match "/:id/:location/push_button" => "rooms#push_button", :as => :room_push_button

  resources :enemies, :only => [:create]

  # you can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'ships#new'

  # see how all your routes lay out with "rake routes"

  # this is a legacy wild controller route that's not recommended for restful applications.
  # note: this route will make all actions in every controller accessible via get requests.
  # match ':controller(/:action(/:id))(.:format)'
end

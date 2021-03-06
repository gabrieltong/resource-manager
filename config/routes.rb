GithubManager::Application.routes.draw do

  resources :projects


  match '/rate' => 'rater#create', :as => 'rate'

  get "entrance/home"

  resources :tags,:only=>[:index] do
    collection do
      post :add
      match :prefetch
    end

    resources :gb_repos,:only=>[:index,:show] do
    end

    resources :gists,:only=>[:index,:show] do
    end
  end


  # resources :users,:only=>[:index,:show,:destroy,:edit,:update] do
  # resources :users,:only=>[:index,:show,:destroy,:edit,:update] do
  resources :users,:only=>[:index,:show,:destroy,:edit,:update] do  
    resources :tags,:only=>[:index,:show] do
      resources :gb_repos,:only=>[:index]
      resources :gists,:only=>[:index]
    end

    resources :gb_users,:only=>[:index,:show,:new,:create,:update,:edit] do
    end

    resources :gb_repos,:only=>[:index,:show] do
    end

    resources :gists,:only=>[:index,:show] do
    end

    member do
      match :import_newest_stared_gb_repos
      match :import_stared_gb_repos
      match :import_gists
    end
  end


  resources :gb_users,:only=>[:index,:show] do
  end

  resources :gb_repos,:only=>[:index,:show] do

  end

  resources :tags,:only=>[:index,:show]

  resources :gists,:only=>[:index,:show]

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
  root :to => 'users#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

Xander::Application.routes.draw do
  get "titles/new"

  get "titles/show"

  get "titles/edit"

  get "titles/create"

  get "titles/update"

  get "titles/destroy"

  get "posts/new"

  get "posts/show"

  get "posts/edit"

  get "posts/create"

  get "posts/update"

  get "posts/destroy"

  root :to => 'frontpage#index'

  get '/' => 'frontpage#index'

  # login
  get '/login' => 'sessions#index'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # admin
  get '/admin' => 'admin#index'
  post '/blog' => 'admin#update'

  get '/new_headline' => 'admin#headline_new'
  get '/headline/:id/edit' => 'admin#headline_update'
  post '/new_headline' => 'admin#submit_headline_new'

  get '/post/:id' => 'post#show'
  get '/new_post' => 'post#new'
  get '/post/:id/edit' => 'post#edit'
  post '/new_post' => 'post#create'

  # create new user
  get '/create_new_admin' => 'users#new'
  post '/create_new_admin' => 'users#create'

  # music app
  get "music/index"

  get "music/upload"

  get "music/delete"

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


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

Xander::Application.routes.draw do

  get '/' => 'frontpage#index'
  root :to => 'frontpage#index'

  # login
  get '/login' => 'sessions#index'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # admin
  get '/admin' => 'admin#index'
  post '/blog' => 'admin#update'

  get '/title/new' => 'admin#title_new'
  post '/title/new' => 'admin#title_create'

  get '/post/:id' => 'admin#post_show'
  get '/post/new' => 'admin#post_new'
  post '/post/new' => 'admin#post_create'

  get '/post/:id/edit' => 'admin#post_edit'

  # needs post udpate
  # needs post delete

  # create new user
  get '/create_new_admin' => 'users#new'
  post '/create_new_admin' => 'users#create'

  # needs to delete music routes and AWS support
end

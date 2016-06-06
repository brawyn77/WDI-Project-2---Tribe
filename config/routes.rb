Rails.application.routes.draw do
# Establish scaffolding for the four tables and their data
  resources :posts
  resources :contact_requests
  resources :profiles
  resources :users

# Set front page as root
  root to: 'users#homepage'
  get '/user_about' => 'users#about'

# Manage the first interaction with the user registering by routing to the registration form
  get '/user_new' => 'users#new'
  post '/user_new' => 'users#create'

# Manage the logon screen
  get '/user_login' => 'sessions#new'
  post '/user_login' => 'sessions#create'
  post '/user_logout' => 'sessions#destroy'

# Manage the link to the profile page via a new profile form
  get '/profile_new' => 'profiles#new'
  post '/profile_new' => 'profiles#create'
  get '/profile_show' => 'profiles#show'
  get '/profile_edit' => 'profiles#edit'
  patch '/profile_path' => 'profiles#update'

# Manage the link to the profile search page
  get '/profile_search' => 'profiles#search'

# Manage the link to the new contact request page via a form
  delete '/user_destroy' => 'users#destroy'
  get '/user_new' => 'users#new'
  post '/user' => 'users#create'
  patch 'user_update' => 'users#update'
  get '/user_edit' => 'users#edit'

# Manage the link to the show contact requests

# Manage the link to the Messages screen

# Manage the link to the new message screen via a form

end

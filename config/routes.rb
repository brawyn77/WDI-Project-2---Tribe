Rails.application.routes.draw do
# Establish scaffolding for the four tables and their data
  resources :posts
  resources :contact_requests
  resources :profiles
  resources :users

# Set front page as root
  root to: 'users#homepage'

# Manage the first interaction with the user registering by routing to the registration form
  get '/user_new' => 'users#new'
  post '/user_create' => 'users#create'

# Manage the logon screen
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

# Manage the link to the profile page via a new profile form
  get '/profile_index' => 'profiles#new'
  post '/profiles' => 'profiles#create'
  get '/profile_show' => 'profiles#show'

# Manage the link to the profile search page

# Manage the link to the new contact request page via a form
  delete '/users/destroy' => 'users#destroy'
  get '/users/new' => 'users#new'
  post '/users' => 'users#create'
  patch 'users/update' => 'users#update'
  get '/users/edit' => 'users#edit'

# Manage the link to the show contact requests

# Manage the link to the Messages screen

# Manage the link to the new message screen via a form

end

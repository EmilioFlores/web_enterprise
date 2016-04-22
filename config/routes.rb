Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  root 'welcome#home'

  post '/set_locale', to: 'users#set_locale', as: :set_user_locale

  resources :prospects
  resources :clients
  resources :policies
  resources :referrals

  ###################################USERS######################################

  get 'users/:id', to: 'users#profile',  as: :user

  ##############################################################################

  get '/complete_registration', to: 'users#complete_registration',
  															as: :complete_registration
  patch '/complete_registration/:id', to: 'users#complete_registration_update',
  																		as: :complete_registration_update
  get '/user_companies', to: 'users#user_companies', as: :user_companies
end

Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  root 'welcome#home'

  post '/set_locale', to: 'users#set_locale', as: :set_user_locale


  resources :clients

  get '/complete_registration', to: 'users#complete_registration',
  															as: :complete_registration
  patch '/complete_registration', to: 'user#complete_registration_update',
  																as: :complete_registration_update

end

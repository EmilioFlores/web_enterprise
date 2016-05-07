Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  root 'calendar#index'

  get '/disabled', to: 'welcome#user_disabled', as: :user_disabled

  post '/set_locale', to: 'users#set_locale', as: :set_user_locale

  resources :prospects
  resources :clients
  resources :policies
  resources :referrals

  ###################################USERS######################################

  get '/users/:id', to: 'users#profile',  as: :user

  ##############################################################################

  get '/complete_registration', to: 'users#complete_registration',
  															as: :complete_registration
  patch '/complete_registration/:id', to: 'users#complete_registration_update',
  																		as: :complete_registration_update
  get '/user_companies', to: 'users#user_companies', as: :user_companies

  get '/calendar', to: 'calendar#index',  as: :calendar


  ##############################################################################

  get '/admin/index', to: 'admin#index', as: :admin_index
  get '/admin/users_manage', to: 'admin#users_manage',
                             as: :admin_users_manage
  post '/admin/users_manage', to: 'admin#update_user'

  get '/admin/referrals_manage', to: 'admin#referrals_manage',
                                 as: :admin_referrals_manage


  ##############################################################################

end

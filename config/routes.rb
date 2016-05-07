Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  root 'calendar#index'

  get '/disabled', to: 'welcome#user_disabled', as: :user_disabled

  post '/set_locale', to: 'users#set_locale', as: :set_user_locale

  resources :prospects
  resources :clients
  resources :policies
  resources :referrals

  get '/user/company/:id', to: 'company_users#show', as: :company_user

  ###################################USERS######################################

  get '/user', to: 'users#profile',  as: :user
  get '/new/user/company', to: 'users#new_company', as: :new_user_company
  post '/new/user/company', to: 'users#create_company'
  get '/edit/user/company/:id', to: 'users#edit_company', as: :edit_user_company
  patch '/edit/user/company/:id', to: 'users#update_company'

  ##############################################################################

  get '/complete_registration', to: 'users#complete_registration',
  															as: :complete_registration
  patch '/complete_registration/:id', to: 'users#complete_registration_update',
  																		as: :complete_registration_update

  get '/calendar', to: 'calendar#index',  as: :calendar


  ##############################################################################

  get '/admin/index', to: 'admin#index', as: :admin_index
  get '/admin/users_manage', to: 'admin#users_manage',
                             as: :admin_users_manage
  post '/admin/users_manage', to: 'admin#update_user'

  get '/admin/referrals_manage', to: 'admin#referrals_manage',
                                 as: :admin_referrals_manage

  delete 'admin/delete_referral/:id', to: 'admin#destroy_referral',
                                      as: :admin_destroy_referral


  ##############################################################################

end

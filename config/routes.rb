Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  root 'welcome#home'

  post '/set_locale/wow', to: 'users#set_locale', as: :set_user_locale
end

Portfolio::Application.routes.draw do
  if Rails.env.production?
    devise_for :users, :controllers => { :registrations => "registrations" }
  else
    devise_for :users
  end

  authenticated :user do
    root :to => 'home#index'
  end

  match '/contacts' => 'home#contacts'
  match '/rss' => 'home#index', :defaults => { :format => 'rss' }

  root :to => 'home#index'

  resources :albums
  resources :images
end

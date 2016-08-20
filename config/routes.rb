Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  
  ActiveAdmin.routes(self)
  resources :attractions, only: [:index, :show]
  root to: 'high_voltage/pages#show', id: 'home'
end

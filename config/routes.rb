Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  resources :attractions, only: [:index, :show]
  root to: 'high_voltage/pages#show', id: 'home'
end

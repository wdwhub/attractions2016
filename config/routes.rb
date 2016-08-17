Rails.application.routes.draw do

  resources :attractions, only: [:index, :show]
  root to: 'high_voltage/pages#show', id: 'home'
end

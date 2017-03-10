Rails.application.routes.draw do

  get 'items/new'

  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    resources :items, only: [:create]
  end

  get 'welcome/index'

  get 'welcome/about'

  root 'users#show'
end

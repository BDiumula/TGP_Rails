Rails.application.routes.draw do
  root to: 'home#show'
  get '/welcome/:name', to: 'welcome#index', as: 'welcome'
  get '/contact', to: 'contact#show'
  get '/team', to: 'team#show'
  resources :gossips
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

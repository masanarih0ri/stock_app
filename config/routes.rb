Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  namespace :admin do
    resources :users
  end
  root to: 'stocks#index'
  # /stocksのhttpメソッドを一括生成
  resources :stocks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

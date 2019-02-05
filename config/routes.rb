Rails.application.routes.draw do
  # get '/', to: 'top#index'
  root to: 'stocks#index'
  # /stocksのhttpメソッドを一括生成
  resources :stocks


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

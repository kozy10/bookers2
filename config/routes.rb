Rails.application.routes.draw do

# deviseを使用する際にurlとしてusersを含む
  devise_for :users



  resources :users, only:[:show, :edit, :update, :index]
  resources :books
  
  # トップページのルーティング
  get '/' => 'users#top', as: 'top'
  get 'home/about' => 'users#about', as: 'about'

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :pictures
  resources :pictures
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/pictures/upload', to: 'pictures#upload'
  root to: "pictures#index"
  get '/frs', to: 'pictures#frs'
end

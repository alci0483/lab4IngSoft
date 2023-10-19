Rails.application.routes.draw do
  resources :monsters, only: [:index, :show]
  resources :tweets, only: [:index, :show, :new, :create]


  get '/tweets', to: 'tweets#index'
  get '/tweets/new', to: 'tweets#new'
  post '/tweets', to: 'tweets#create'
  get '/tweets/:id', to: 'tweets#show'
  get '/tweets/:id/edit', to: 'tweets#edit'
  put '/tweets/:id', to: 'tweets#update'
  patch '/tweets/:id', to: 'tweets#update'
  delete '/tweets/:id', to: 'tweets#destroy'

  root "tweets#index"

end

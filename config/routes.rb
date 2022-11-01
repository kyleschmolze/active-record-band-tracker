# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  get 'bands', to: 'bands#index'
  get 'bands/:slug', to: 'bands#show'
  post 'bands', to: 'bands#create'
  post 'bands/:slug', to: 'bands#update'
  delete 'bands/:slug', to: 'bands#destroy'
end

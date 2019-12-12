Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
    #  resources :users
      get 'users', to: 'users#index'
      get 'packages', to: 'users#packages'
      post 'auth/login', to: 'users#login'
      get 'test', to: 'users#test'
    end
  end
  get 'signup', to: 'login#new'
end

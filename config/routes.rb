Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do

    root to: "home#index"
    resources :movies
    resources :series
    resources :rentals    

  end
  root to: "admin/home#index"

  

end

Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "toilets#index"
  get "toilets/search"
  resources :toilets
end

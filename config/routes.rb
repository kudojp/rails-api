Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :v1 do
    resource :sessions, only: [:create, :destroy]
    resources :contacts
  end

end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
namespace :api, defaults: { format: :json } do
    resources :users do
      resources :lists
    end

    resources :lists, only: [] do
      resources :items, only: [:create]
    end

    resources :items, only: [:update, :destroy]
  end
end

Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :posts, only: [:index, :new, :show, :create, :destroy] do
    resources :comments, only: [:index, :create, :new]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

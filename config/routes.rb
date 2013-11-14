Tinytalk::Application.routes.draw do
  resources :pins
  resources :comments, only: [:create]

  devise_for :users

  root to: "home#signin"

  match "index", to: "home#index"

  put "/update", to: "home#update"

  resources :boards do
    resources :pins
  end

end

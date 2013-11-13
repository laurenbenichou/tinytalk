Tinytalk::Application.routes.draw do
  resources :pins


  devise_for :users

  root to: "home#signin"

  match "index", to: "home#index"

  put "/update", to: "home#update"

  resources :boards

end

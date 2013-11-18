Tinytalk::Application.routes.draw do




  resources :comments, only: [:create, :edit, :update, :destroy]

  devise_for :users

  root to: "home#signin"

  match "index", to: "home#index"

  put "/update", to: "home#update"

  match 'boards/remove_user_from_board/:board_id/:user_id' => 'boards#remove_user_from_board'

  resources :boards do
    resources :pins
    resources :text_pins
    resources :links
  end

end

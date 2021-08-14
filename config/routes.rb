Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
# チャットルーム一覧をトップページにしたかったのでこのようにルートパスを変更した
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create]

end

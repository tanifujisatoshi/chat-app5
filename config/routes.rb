Rails.application.routes.draw do
  devise_for :users
  root to: "messages#index"
  resources :users, only: [:edit, :update]
  # resourcesメソッドを使用することでusersコントローラーの7つのアクション(index show new create edit update destroy)へのルーティングを設定している
  # onlyオプションを用いることでusersコントローラーのedit(編集)アクションとupdate(更新)アクションのみのルーティングを設定している
end

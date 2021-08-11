Rails.application.routes.draw do
  devise_for :users
  root to: "messages#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create]
  # resourcesメソッドでroomsコントローラーの7つのアクションを定義している
  # それらのアクションのうちnewとcreateのみが作動させるようにしている
  # なぜその２つのアクションのみをしてしているのかというと・・・
  # newアクションではroomsの新規のインスタンスを作成する準備をしているだけでありcreateアクションで
  # ようやく新規のチャットルームを作成することができる
end

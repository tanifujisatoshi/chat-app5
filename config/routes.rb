Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create] do
    resources :messages, only: [:index, :create]
  end
end

# 今回messagesコントローラーにはメッセージの一覧表示(indexアクション)とメッセージの送信(createアクション)のみが必要なのでresourcesメソッドで７つのアクションを定義してonlyオプションを使うことで特定のアクションしか作動させないようにしている

# messeagesコントローラーが子でroomsコントローラーが親であるようにネストをしている理由とは？
# どのルームで投稿されたメッセージなのかをparamsを通して送られるパスから判断したいから
# roomsテーブルのレコードのidをparamsに追加してコントローラーに送ることができる

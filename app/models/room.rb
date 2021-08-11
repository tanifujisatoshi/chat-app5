class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users
# roomsテーブルはroom_usersと1対多の関係であるためこのような記述をしている
# roomsテーブルは複数のuserの情報を持っているのでhas_manyを使っている
# roomsテーブルとusersテーブルには中間テーブル(このテーブルを用意しないとusers,roomsテーブルに無駄なカラムが生じてしまう)があるのでthroughオプションを使ってそのように記述している
end

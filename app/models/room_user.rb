class RoomUser < ApplicationRecord
  belongs_to :room
  belongs_to :user
  # RoomUsersテーブルとroom userテーブルの関係は１対多の関係であるためbelongs_toオプションを使っている
end

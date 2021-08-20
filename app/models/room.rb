class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users  
  has_many :messages, dependent: :destroy
# チャットルームが削除された時に一緒に削除されて欲しいものはroom_idが保存されているroom_usersテーブルとmessagesテーブルなのでそれらにdependent: :destroyをつけている

  validates :name, presence: true
end

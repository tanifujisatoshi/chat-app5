class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users
  has_many :messages
  # チャットルームは多くのメッセージを持つことができるのでhas_manyを使っている

  validates :name, presence: true
end

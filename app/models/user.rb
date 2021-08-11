class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :room_users
  has_many :rooms, through: :room_users
  # room_usersとは1対多の関係にあるのでhas_manyオプションを使ってそのように表記している
  # usersテーブルは複数のチャットルームを持っているのでhas_manyオプションを使ってそのように表記している
  # 多対多のアソシエーションを組むときには中間テーブルを用意する必要があるためthroughオプションを使ってそのように記述している
end

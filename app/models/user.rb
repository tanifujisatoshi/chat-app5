class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
# Nameを空のまま新規アカウントを作成させないようにしている
# emailとpasswordに関してはdeviseの機能によってデフォルトでnull: falseがかかっているのでバリデーションを記述する必要がない
end

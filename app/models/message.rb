class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image

  validates :content, presence: true, unless: :was_attached?
# validatesのunlessオプションにメソッド名を指定することでメソッドの返り値がfalseであればバリデーションの検証を行う つまり 投稿をするときに画像が空であればcontentが空であるかどうかを検証する
# was_attached?メソッドはrailsにあるメソッドではなく自分が作り出したメソッドなのでdef~endを用いてメソッドの処理を記述している
  
  def was_attached?
    self.image.attached?
# 投稿をするときに画像があればtrueを 無ければfalseを返す
# つまり unlessは結果がfalseであれば処理がされるので trueであった場合はcontentが空であるかの検証はされない
  end
end

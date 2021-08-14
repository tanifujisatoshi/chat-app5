class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string  :content
    # メッセージの内容をデータベースに保存するためのカラムをcontentとしている
    # そのカラムの型をstring型にして255文字まで保存できるようにしている
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    # メッセージがどのチャットルームで発信されたものなのか 誰が投稿したものなのかをデータベースに保存するためにreferences型を使用して外部キーカラムを作成している
      t.timestamps
    end
  end
end

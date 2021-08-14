class CreateRoomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :room_users do |t|
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    # t.referencesと記述することで外部キーであるカラムを作成することができる
    # foreign_key: trueがあることで外部キーのテーブルの情報を参照することができる
      t.timestamps
    end
  end
end

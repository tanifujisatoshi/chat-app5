class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
# メッセージは1つのroomに属している そして一人のuserの属しているためbelongs_toを使っている
end

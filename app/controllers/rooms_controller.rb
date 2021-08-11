class RoomsController < ApplicationController
  def new
    @room = Room.new
  # 新規チャットルームを作成するためにroomsテーブルにnewメソッドを使うことで新規のインスタンスを作成している
  end
end

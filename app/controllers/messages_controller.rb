class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
    # メッセージが正しく保存された場合は以下の処理を行う
      redirect_to room_messages_path(@room)
    # messagesコントローラーのindexのビューを表示させる
    # そのパスのURIには/rooms/:room_id/messagesとあるのでメッセージを投稿したroomsテーブルのidをパスに持たせて送らなければならない
    # なのでcreateアクションの直下にroomsのidを取得して@roomに代入しているのでそれを使う
    else
      render :index
    # メッセージの保存に失敗した場合はmessagesコントローラーのindexのビューを表示させる
    # if文の処理と同じように見えるがrenderメソッドを使用しているので入力した内容は残ったままである
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  # requireメソッドでparamsから送られるハッシュのmessageを取得している
  # permitメソッドでcontentカラムの保存の許可をしている
  # mergeメソッドを使って誰が(user_id)メッセージを投稿したのかを示すために記述している
  # ログインしている人しかメッセージを投稿できないのでuser_idに対応する部分をcurrent_user.idにしている
  end

end

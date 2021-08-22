class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
  # アソシエーションを利用しているのでDBへのアクセス回数が多くなる
  # 今回はmessagesテーブルに関するusersテーブルの情報の取得をするためにメッセージと同じ回数アクセスが必要になる(これをN+1問題と呼ぶ)
  # その問題を解決するためにincludesメソッド(これはallメソッドの代わりにもなっている！)を使っている
  # @room.messagesはどのチャットルームで投稿されたメッセージなのかを意味している
  # それにincludesメソッドを使用してさらに引数にmessagesテーブルに紐づくモデル名(今回はuser)を用意することでDBへのアクセス回数が減りN+1問題を解決できる
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
    # このように記述することで保存に失敗した場合でも投稿前と同じメッセージ一覧になっている
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  # フォームから送られてきたparamsのハッシュからrequireメソッドを使いmessageキーのバリューを取り出している
  # そのバリューの中にあるキーであるcontentキー, imageキーの値をpermitメソッドを使いmessagesテーブルに保存を許可している
  # 誰がメッセージを投稿したかを判別するためにmergeメソッドを使いuser_id(誰が)の部分をcurrent_user.id(現在ログインしているユーザー)にしている
  end

end

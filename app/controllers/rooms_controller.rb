class RoomsController < ApplicationController
  
  def index
    # ルートパスが送られた次にコントローラにroomsのindexは無いかを確認するのでこの記述は必要
    # この記述があることでroomsのindex.html.erbを表示できる
  end
  
  def new
    @room = Room.new
  # 新規チャットルームを作成するためにroomsテーブルにnewメソッドを使うことで新規のインスタンスを作成している
  end

  def create
    @room = Room.new(room_params)
  # Roomモデルの新規のインスタンスを作成している
  # フォームから送られたparamsの値を受け取るために引数を用意している(引数名は任意で決められる)
  # なぜ引数を用意しているのかというとフォームから入力された値が正しいものかを確かめるためである
    if @room.save
      redirect_to root_path
  # 保存に成功した場合はチャット画面に遷移する
    else
      render :new
  # 保存に失敗した場合はroomsのnew.html.erbに遷移する
  # renderメソッドを使用しているので入力したものは消えずに残っている
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end
  # destroyアクションの処理の流れについて
  # ①ルームを削除しようとしたときrooms#destroyのURIは/rooms/:idなのでビューからparamsを通してハッシュでルームのidが送られてくる そのキーからバリューを取り出すためにparams[:id]と記述するそれがfindメソッドの引数となりroomsテーブルのレコードを取得できる
  # ②destroyメソッドを使うことでroomという変数に代入したレコードを削除できる
  # ③roomsコントローラーのindexアクションのビューに遷移する(チャット内容が表示されていない画面に遷移する)

  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  # requireメソッドを使ってroomモデルというパラメーターから情報を取得している
  # permitメソッドを使用することで指定したキーの値を保存することができる
  # user_idsに関してはフォームから配列でコントローラーに送られてくるため[]を用意している
  end

end

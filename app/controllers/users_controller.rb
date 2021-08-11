class UsersController < ApplicationController
  def edit
  end
# このコントローラーにeditアクションを書き忘れるとエラーが起きる その理由は・・・
# 編集画面に遷移するために/users/:id/editというパスが送られルーティングでusersコントローラーのeditアクションを探しにいく そこでeditアクションを見つけたら今度はusersコントローラーにeditアクションがあるかどうか探しにいく
# ここで仮にusersコントローラーのeditのビューファイルがあったとしてもusersコントローラーにeditアクションがありませんということでエラーが表示される

def update
  if current_user.update(user_params)
    redirect_to root_path
  # 現在ログインしているユーザーの情報の更新に成功した場合トップページに遷移する
  # root_pathについてですがこれはrails routesで確認するとmessages#indexのPrefixのrootを参照している
  else
    render :edit
  # 現在ログインしているユーザーの情報の更新に失敗したとき編集画面に遷移する
  # renderメソッドを使用しているので入力した情報は残ったままである
  end
end

private

def user_params
  params.require(:user).permit(:name, :email)
# 送られたparamsの情報にはusersテーブルが2重ハッシュになっているので取り出すためにrequireメソッドを使用している
# 送られたparamsの情報にあるnameカラムとemailカラムの保存を許可している
end

end

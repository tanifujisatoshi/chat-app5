class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # ApplicationControllerにこれを記述している理由はこのコントローラーは他の全てのコントローラを司っていて他のコントローラーに before_action :authenticate_user! を読み込ませている
# だから他のコントローラーに before_action :authenticate_user! を書く必要がない
# before_actionを用いることで各アクションが動く前にそれに続けて記述したメソッドが実行される
# authenticate_user!メソッドはユーザーがログインしていなければログイン画面に遷移させる
  before_action :configure_permitted_parameters, if: :devise_controller?
  # configure_permitted_parametersというメソッド名は慣習的なものなので自分で自由に決めて良い
 # ifに続いてメソッド名(?がついているので真偽値を確かめることができる)を指定することでそのメソッドの返り値がtrueであった時のみconfigure_permitted_parametersメソッドが実行される
 # devise_controller?メソッドはdeviseのコントローラーの処理であればtrueを返す

  private
  def configure_permitted_parameters # このメソッド名は自由に決めることができる
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  # devise特有のパラメータを取得するためにdevise_parameter_sanitizerという記述をしている
  # これを記述することでdeviseのUserモデルに関する「ログイン」「新規登録」などをしたときにパラメーターを取得することができる
  # このメソッドにpermitメソッドを使うことで取得したいキーを指定することができ指定したキーとそのバリューを取得することが出来る
  # sign_up(新規登録)はdeviseの処理名を表していて、今回は新規登録をする際のストロングパラメータに関するものなので第一引数には:sign_upと記述している
  # 第二引数にはkeysに対し配列で許可するキーを指定している
  # deviseのストロングパラメータはそれのコントローラーがgemに記述されているため編集ができないのでこのコントローラーに記述している
  # Railsでのpermitメソッドとの記述が違う理由はこのpermitmメソッドはdeviseで定義されたものだから
  end


end

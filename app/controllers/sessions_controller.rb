class SessionsController < ApplicationController
  skip_before_action :login_required

  def new
  end

  def create
    # 送られてきたユーザーでメールアドレスがあるかを検索
    user = User.find_by(email: session_params[:email])
    # ユーザーが見つかった場合は、送られてきたパスワードをauthenticateメソッドを使って認証を行う
    # これはUserクラスにhas_secure_passwordと記述したときに自動で追加された認証のためのメソッド
    # 引数で受け取ったパスワードをハッシュ化してその結果がUserオブジェクトに保存しているdigestと一致するかを調べる
    # メールアドレスに対応するユーザーデータがないときにはuserはnilになるので呼び出す部分で&.を使っている
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'ログインしました'
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'ログアウトしました。'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end

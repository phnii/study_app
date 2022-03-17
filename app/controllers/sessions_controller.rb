class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to :root
    else
      @form = LoginForm.new
      render action: "new"
    end
  end

  def create
    @form = LoginForm.new(login_params)
    if @form.email.present?
      user = User.find_by(email: @form.email)
    end
    if Authenticator.new(user).authenticate(@form.password)
      session[:user_id] = user.id
      session[:last_access_time] = Time.current
      flash.notice = "ログインしました"
      redirect_to :root
    else
      flash.now.alert = "メールアドレスまたはパスワードが正しくありません"
      render action: "new"
    end
  end

  def destroy
      session.delete(:user_id)
      redirect_to :root
  end

  private def login_params
    params.require(:login_form).permit(:email, :password)
  end
end

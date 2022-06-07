class Api::V1::SessionsController < ApplicationController
  include SessionsHelper
  # skip_before_action :login_check, only:[:new, :create, :destroy]
  def new
    current_user
    if logged_in?
      redirect_to user_path(@current_user)
    else
      render file: '/sessions/new'
    end
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      login(user)
      cookies.encrypted[:user_id_for_chat] = user.id
      flash[:success] = 'ログインしました'
      redirect_to user_path(user)
    else
      flash.now[:danger] = 'ログインに失敗しました'

      render 'new'
    end
  end

  def destroy
    log_out
    cookies.encrypted[:user_id_for_chat] = nil
    redirect_to login_path
  end

  # copy from the site for react login system
  def login
    @user = User.find_by(email: session_params[:email])

    if @user && @user.authenticate(session_params[:password])
      login! # application_controllerにhelperとして記述
      render json: { logged_in: true, user: @user }
    else
      render json: { status: 401, errors: ['認証に失敗しました。', '正しいメールアドレス・パスワードを入力し直すか、新規登録を行ってください。'] }
    end
  end

  def logout
    reset_session
    render json: { status: 200, logged_out: true }
  end

  def logged_in?
    if current_user # helper method written in application_contoller
      render json: { logged_in: true, user: @current_user }
    else
      render json: { logged_in: false, message: 'ユーザーが存在しません' }
    end
  end

  private

  def session_params
    params.require(:user).permit(:username, :email, :password)
  end

  # end of the copy
end

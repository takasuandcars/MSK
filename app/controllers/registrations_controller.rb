class RegistrationsController < ApplicationController
  skip_before_action :login_check
  def new
    current_user
    if logged_in?
      redirect_to user_path(@current_user)
    else
      render file: '/sessions/new'
    end
  end

  def signup
    @user = User.new(registrations_params)

    if @user.save
      login!
      render json: { status: :created, user: @user }
    else
      render json: { status: 500 }
    end
  end

  def login
    user = User.find_by(email: params[:user][:email])

    if user && user.authenticate(params[:user][:password])
      login_user(user)
      cookies.encrypted[:user_id_for_chat] = user.id
      render json: { status: :created, user: @user }

    else
      flash.now[:danger] = 'ログインに失敗しました'

      render 'new'
    end
  end

  def login_user(user)
    session[:user_id] = user.id
  end

  private

  def registrations_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end

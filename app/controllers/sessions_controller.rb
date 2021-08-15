class SessionsController < ApplicationController
  include SessionsHelper
  skip_before_action :login_check, only:[:new, :create, :destroy]
  def new
    current_user
    if logged_in?
      redirect_to user_path(@current_user)
    else
      render file: "/sessions/new"
    end
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      login(user)
      cookies.encrypted[:user_id_for_chat] = user.id
      flash[:success] = "ログインしました"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "ログインに失敗しました"
      
      render 'new'
    end
  end

  def destroy
    log_out
    cookies.encrypted[:user_id_for_chat] = nil
    redirect_to login_path
    
    
  end

end


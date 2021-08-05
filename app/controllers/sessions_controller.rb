class SessionsController < ApplicationController
  include SessionsHelper
  skip_before_action :login_check, only:[:new, :create, :destroy]
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      login(user)
      flash[:success] = "ログインしました"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "ログインに失敗しました"
      
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
    
    
  end

end


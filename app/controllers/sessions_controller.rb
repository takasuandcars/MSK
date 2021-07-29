class SessionsController < ApplicationController
  include SessionsHelper
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      login(user)
      flash[:success] = "ログインしました"
      redirect_to root_url
    else
      flash[:danger] = "ログインに失敗しました"
      
      render 'new'
    end
  end

  def destroy
  end

end


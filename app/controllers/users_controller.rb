class UsersController < ApplicationController
  def index
    @datas = User.all.page(params[:page]).per(20)
    
  end
  
  def show
    @user = User.find_by(id: current_user.id)
  end 
end

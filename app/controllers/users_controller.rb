class UsersController < ApplicationController
  def index
    @datas = User.all.page(params[:page]).per(20)
    
  end
end

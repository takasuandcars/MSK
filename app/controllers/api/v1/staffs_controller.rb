class StaffsController < ApplicationController
  def index
    
    @datas = Staff.all.page(params[:page]).per(20)
  end
end

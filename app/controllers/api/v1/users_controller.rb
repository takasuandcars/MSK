class UsersController < ApplicationController
  require 'rqrcode'
  require 'rqrcode_png'
  require 'chunky_png'

  def index
    @datas = User.all.page(params[:page]).per(20)
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def show
    now_month = Time.now.month
    @user = User.find_by(id: params[:id])
    work_data = @user.work_times.where('extract(month from start) = ?', now_month)

    work_hours = work_data.sum(:hours)
    @work_hours = (work_hours - (work_hours % 60)) / 60

    content = @user.qrcode.to_s
    size    = 3           # 1..40
    level   = :h # l, m, q, h

    qr = RQRCode::QRCode.new(content, size: size, level: level)
    # png変換->リサイズ->base64エンコード
    @qr_base64 = qr.as_png.resize(100, 100).to_data_url
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.valid?
      @user.save
      flash[:success] = 'ユーザーを作成しました'
      redirect_to user_path(@user)
    else
      flash[:danger] = 'ユーザー作成に失敗しました'
      redirect_to new_user_path
    end
  end

  private

  def params_user
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

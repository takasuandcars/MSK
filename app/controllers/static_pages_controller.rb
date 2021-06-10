class StaticPagesController < ApplicationController
  def index
    @received = Received.new
    @datas = Received.all
  end
end

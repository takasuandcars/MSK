class StaticPagesController < ApplicationController
  def index
     @received = Received.new
     @pickup_request = PickupRequest.new
     
     @datas = Received.all
     @datas += PickupRequest.all
     
   
     
  end
end

class EventsController < ApplicationController
  def index
    start = params[:start]
    enddate = params[:end]
    @events = PickupRequest.where(pickup_date: start..enddate )
    respond_to do | format |
      format.html
      format.json
    end
  end
  
  def pickup
      start = params[:start]
      enddate = params[:end]
      @events = PickupRequest.where(pickup_date: start..enddate )
      respond_to do | format |
      format.html
      format.json
      end
  end
  
  def received
    start = params[:start]
    enddate = params[:end]
    @events = Received.where(received_date: start..enddate ).select('id','received_date', 'number_of_order').where(pickup_request_id: nil).group(:received_date).sum(:number_of_order) 
    respond_to do | format |
      format.html
      format.json
    end
  end
  
  # user-info
  def work_hours
     @user = User.find_by(id: current_user.id)
     @events = @user.work_times
  end
end

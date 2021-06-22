class EventsController < ApplicationController
  def index
    
    @events = PickupRequest.all
    respond_to do | format |
      format.html
      format.json
    end
  end
  
  def pickup
      @events = PickupRequest.all
      respond_to do | format |
      format.html
      format.json
      end
  end
  
  def received
    
    @events = Received.select('id','received_date', 'number_of_order').where(pickup_request_id: nil).group(:received_date).sum(:number_of_order) 
  
    respond_to do | format |
      format.html
      format.json
      end
  end
end

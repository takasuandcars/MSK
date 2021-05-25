class StaticPagesController < ApplicationController
  def index
     @received = Received.new
     @pickup_request = PickupRequest.new
     
     @datas = ActiveRecord::Base.connection.select_all("SELECT receiveds.*, pickup_requests.id AS pickup_requests_id, pickup_requests.pickup_date, pickup_requests.arrange, pickup_requests.car_number, pickup_requests.received, pickup_requests.number_of_total_order FROM receiveds LEFT OUTER JOIN pickup_requests ON receiveds.pickup_request_id = pickup_requests.id UNION SELECT receiveds.*, pickup_requests.id AS pickup_requests_id, pickup_requests.pickup_date, pickup_requests.arrange, pickup_requests.car_number, pickup_requests.received, pickup_requests.number_of_total_order FROM receiveds RIGHT OUTER JOIN pickup_requests ON receiveds.pickup_request_id = pickup_requests.id")
    
  end
end

class StaticPagesController < ApplicationController
  def index
    @received = Received.new
    @pickup_request = PickupRequest.new
     
    @datas = ActiveRecord::Base.connection.select_all("
    SELECT
        receiveds.*, 
        pickup_requests.id AS pickup_requests_id,
        pickup_requests.pickup_date,
        pickup_requests.arrange,
        pickup_requests.car_number,
        pickup_requests.received,
        pickup_requests.number_of_total_order
        FROM receiveds
        LEFT OUTER JOIN pickup_requests ON receiveds.pickup_request_id = pickup_requests.id 
        WHERE receiveds.pickup_request_id IS NULL
        UNION 
        SELECT 
        receiveds.*,
        pickup_requests.id AS pickup_requests_id,
        pickup_requests.pickup_date,
        pickup_requests.arrange,
        pickup_requests.car_number,
        pickup_requests.received,
        pickup_requests.number_of_total_order 
        FROM receiveds
        RIGHT OUTER JOIN pickup_requests ON receiveds.pickup_request_id = pickup_requests.id 
        WHERE receiveds.pickup_request_id IS NULL
        
        UNION
        SELECT *
        
        FROM
        (
        SELECT 
        MAX(sort.id) as id,
        MAX(sort.received_date) as received_date,
        MAX(sort.awb) as awb,
        MAX(sort.invoice) as invoice,
        MAX(sort.inspection) as inspection,
        MAX(sort.shipping) as shipping,
        MAX(sort.shipped_date) as shipped_date,
        MAX(sort.number_of_order) as number_of_order,
        MAX(sort.created_at) as created_at,
        MAX(sort.updated_at) as updated_at,
        MAX(sort.pickup_request_id) as pickup_request_id,
        MAX(sort.pickup_requests_id) as pickup_requests_id,
        MAX(sort.pickup_date) as pickup_date,
        MAX(sort.arrange) as arrange,
        MAX(sort.car_number) as car_number,
        MAX(sort.received) as received,
        MAX(sort.number_of_total_order) as number_of_total_order
        
        From 
        (SELECT 
        receiveds.*, 
        pickup_requests.id AS pickup_requests_id,
        pickup_requests.pickup_date,
        pickup_requests.arrange,
        pickup_requests.car_number,
        pickup_requests.received,
        pickup_requests.number_of_total_order
        FROM receiveds 
        LEFT OUTER JOIN pickup_requests ON receiveds.pickup_request_id = pickup_requests.id 
        UNION 
        SELECT 
        receiveds.*,
        pickup_requests.id AS pickup_requests_id,
        pickup_requests.pickup_date,
        pickup_requests.arrange,
        pickup_requests.car_number,
        pickup_requests.received,
        pickup_requests.number_of_total_order 
        FROM receiveds 
        RIGHT OUTER JOIN pickup_requests ON receiveds.pickup_request_id = pickup_requests.id) AS sort
        WHERE NOT sort.pickup_request_id IS NULL
        GROUP BY sort.pickup_request_id
      ) AS sort2
    ")
     
  end
end

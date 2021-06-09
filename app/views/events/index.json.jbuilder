json.array!(@events) do |event|
  json.extract! event, :id  
  json.start event.pickup_date   
  json.end event.pickup_date
  json.url events_index_url(event, format: :html) 
end
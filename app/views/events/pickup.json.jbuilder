
json.array!(@events) do |event|
  json.id event.id + 1000
  json.title event.receiveds.all.sum(:number_of_order)
  startdate = WorksController.getworkday(event.pickup_date + 1)
  
  json.start startdate
  
  enddate = WorksController.getworkdayend(startdate + 1)
  
  json.end enddate
  json.url events_index_url(id: event.id, format: :html)
  json.className ["number_of_total_order"]
  json.color "skybule"
end
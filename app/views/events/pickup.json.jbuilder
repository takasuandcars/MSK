json.array!(@events) do |event|
  json.id event.id + 1000
  json.title event.number_of_total_order
  json.start event.pickup_date + 1   
  json.end event.pickup_date + 3
  json.url events_index_url(id: event.id, format: :html)
  json.className ["number_of_total_order"]
  json.color "skybule"
end
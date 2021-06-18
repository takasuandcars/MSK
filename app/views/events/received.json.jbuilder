json.array!(@events) do |event|
  json.id event.id
  json.title event.number_of_order
  json.start event.received_date   
  json.end event.received_date
  json.url events_index_url(id: event.id, format: :html)
  json.className ["received"]
  json.color "pink"
end
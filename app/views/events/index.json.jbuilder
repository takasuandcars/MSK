json.array!(@events) do |event|
  json.id event.id
  json.title '集'
  json.start event.pickup_date
  json.end event.pickup_date
  json.url events_index_url(id: event.id, format: :html)
  json.className ['pickup-request-mark']
  json.color 'skybule'
end

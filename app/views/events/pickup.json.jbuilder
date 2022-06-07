json.array!(@events) do |event|
  json.id event.id + 1000
  json.title event.receiveds.all.sum(:number_of_order)
  startdate = WorksController.getworkday(event.pickup_date)

  json.start startdate

  json.url events_index_url(id: event.id, format: :html)
  json.className ['number_of_total_order']
  json.color 'skybule'
end

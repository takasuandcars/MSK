
json.array!(@events) do |event|
  json.id event.id
  
  json.title "test"
  json.start event.start
  json.end event.end + 1
  json.className ["work-date"]
  json.color "skybule"
end
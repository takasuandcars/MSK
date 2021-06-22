json.array!(@events) do |event|
  json.title event[1]
  json.start event[0]  
  json.end   event[0]
  json.className ["received"]
  json.color "pink"
end
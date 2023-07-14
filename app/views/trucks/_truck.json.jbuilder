json.extract! truck, :name

json.deliveries truck.deliveries do |deliverie|
  json.payload_name deliverie.product.payload_name
  json.payload_size deliverie.product.payload_size
end

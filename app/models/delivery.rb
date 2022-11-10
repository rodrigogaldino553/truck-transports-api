class Delivery < ApplicationRecord
  scope :by_payload_name, -> (payload_name) { where(payload_name: payload_name) }
  #scope :by_date, lambda {|param| where()}

  belongs_to :truck
  belongs_to :product
  #accepts_nested_attributes_for :products, allow_destroy: true

  #def delivery_details
  #  { truck_name: @delivery.truck.name, payload_name: @delivery.product.payload_name, payload_size: @delivery.product.payload_size, total_billing: @delivery.product.total_billing, from: @delivery.product.from, to: @delivery.product.to, date: @delivery.product.created_at }
  #end
end

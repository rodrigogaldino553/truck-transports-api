class Product < ApplicationRecord
  validates :payload_name, presence: true, allow_blank: false
  validates :payload_size, presence:true, numericality: { greater_than: 0 }
  validates :total_billing, presence: true
  validates :from, presence: true, allow_blank: false
  validates :to, presence: true, allow_blank: false
end

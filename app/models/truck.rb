class Truck < ApplicationRecord
  has_many :deliveries, dependent: :destroy
  has_many :products, through: :deliveries

  validates :name, presence: true, allow_blank: false
end

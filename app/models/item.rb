class Item < ApplicationRecord
    belongs_to :inventory

    validates :category, presence: true
    validates :product_name, presence: true
    validates :unit_of_measurement, presence: true
    validates :quantity, presence: true
end

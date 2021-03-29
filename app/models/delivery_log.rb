class DeliveryLog < ApplicationRecord
    has_many :delivery_entries
    has_many :routes
    has_many :stops, through: :routes

end

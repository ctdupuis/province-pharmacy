class DeliveryLog < ApplicationRecord
    has_many :delivery_entries
    belongs_to :report, optional: true
end

class DeliveryEntry < ApplicationRecord
    belongs_to :delivery_log

    validates :patient_name, presence: true
    validates :patient_address, presence: true

    def created
        self.created_at.in_time_zone('Central Time (US & Canada)').strftime("%m/%d/Y")
    end
end

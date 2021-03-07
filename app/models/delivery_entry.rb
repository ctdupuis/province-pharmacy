class DeliveryEntry < ApplicationRecord
    belongs_to :delivery_log
    belongs_to :user

    validates :patient_name, presence: true
    validates :patient_address, presence: true

    def created
        # self.created_at.in_time_zone('Central Time (US & Canada)').strftime("%m/%d/Y")
        self.created_at.in_time_zone('Central Time (US & Canada)').to_date
    end
end

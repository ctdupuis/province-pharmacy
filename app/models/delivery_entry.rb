class DeliveryEntry < ApplicationRecord
    belongs_to :delivery_log
    belongs_to :user

    validates :patient_name, presence: true
    validates :patient_address, presence: true

    def created
        self.created_at.in_time_zone('Central Time (US & Canada)').to_date
    end

    def date_format
        self.created_at.in_time_zone('Central Time (US & Canada)').strftime("%m/%d/%y")
    end

    def as_json(options={})
        super(include: {
            user: {
                only: [:username, :first_name]
            }
        }, methods: [:created, :date_format])
    end
end

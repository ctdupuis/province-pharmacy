class Route < ApplicationRecord
    belongs_to :delivery_log
    belongs_to :user
    has_many :stops

    def date_format
        self.created_at.in_time_zone('Central Time (US & Canada)').strftime("%m/%d/%y")
    end

    def created
        self.created_at.in_time_zone('Central Time (US & Canada)').to_date
    end

    def as_json(options={})
        super(include: {
            user: {
                only: [:username, :first_name]
            },
            stops: {
                only: [:id, :patient_name, :patient_address]
            }
        }, methods: [:date_format])
    end
end

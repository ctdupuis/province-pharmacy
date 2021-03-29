class Route < ApplicationRecord
    belongs_to :delivery_log
    belongs_to :user

    def date_format
        self.created_at.in_time_zone('Central Time (US & Canada)').strftime("%m/%d/%y")
    end

    def as_json(options={})
        super(include: {
            user: {
                only: [:username, :first_name]
            }
        }, methods: [:date_format])
    end
end

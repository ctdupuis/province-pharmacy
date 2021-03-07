class CheckEntry < ApplicationRecord
    belongs_to :check_log

    before_save :format_rx_num

    def price_difference
        return self.original_amt - self.adjusted_amt
    end

    def created
        self.created_at.in_time_zone('Central Time (US & Canada)').to_date
    end

    def as_json(options={})
        super(except: [:created_at, :updated_at], 
            methods: [:created, :price_difference]
        )
    end

    private

    def format_rx_num
        return "RX#" + self.rx_num
    end
end

class CheckEntry < ApplicationRecord
    belongs_to :check_log

    before_save :format_rx_num

    def price_difference
        return self.original_amt - self.adjusted_amt
    end

    private

    def format_rx_num
        return "RX#" + self.rx_num
    end
end

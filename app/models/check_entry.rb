class CheckEntry < ApplicationRecord
    belongs_to :check_log

    def price_difference
        return self.original_amt - self.adjusted_amt
    end
end

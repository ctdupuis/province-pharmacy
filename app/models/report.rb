class Report < ApplicationRecord
    has_one :check_log, optional: true
    has_one :delivery_log, optional: true
end

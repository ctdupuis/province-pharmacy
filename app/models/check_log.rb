class CheckLog < ApplicationRecord
    has_many :check_entries
    belongs_to :report, optional: true
end

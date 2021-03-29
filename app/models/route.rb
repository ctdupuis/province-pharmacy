class Route < ApplicationRecord
    belongs_to :delivery_log
    belongs_to :user
end

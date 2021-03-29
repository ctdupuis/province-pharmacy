class Stop < ApplicationRecord
    belongs_to :route

    validates :patient_name, presence: true
    validates :patient_address, presence: true
end

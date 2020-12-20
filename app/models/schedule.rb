class Schedule < ApplicationRecord
    belongs_to :user
    has_many :shifts, dependent: :destroy

    def self.demo_models
        self.where(demo: true)
    end

    def self.real_models
        self.where(demo: nil)
    end
end

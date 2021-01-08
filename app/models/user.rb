class User < ApplicationRecord
    has_secure_password
    has_many :posts
    has_many :comments, through: :posts
    has_one :schedule, dependent: :destroy
    has_many :shifts, through: :schedules
    has_many :messages
    has_many :delivery_entries
    before_save :username_to_caps


    validates :username, length: { maximum: 3 }, presence: true

    def as_json(options={})
        super(only: [:id, :username, :admin, :first_name, :last_name, :email, :phone, :demo, :schedule])
    end

    private

    def username_to_caps
        self.username = username.upcase
    end

    def self.demo_accounts
        self.where(demo: true)
    end

    def self.real_accounts
        self.where(demo: nil)
    end

end

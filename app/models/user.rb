class User < ApplicationRecord
    has_secure_password
    has_many :posts
    has_many :comments, through: :posts
    has_one :schedule, dependent: :destroy
    has_many :shifts, through: :schedules
    before_save :username_to_caps
    before_save :capitalize_first_name    
    before_save :capitalize_last_name

    validates :username, length: { maximum: 3 }, presence: true

    def as_json(options={})
        super(only: [:id, :username, :admin, :first_name, :last_name, :email, :phone, :demo, :schedule])
    end

    private

    def username_to_caps
        self.username = username.upcase
    end

    def capitalize_first_name
        self.first_name = first_name.capitalize
    end

    def capitalize_last_name
        self.last_name = last_name.capitalize
    end

    def self.demo_accounts
        self.where(demo: true)
    end

    def self.real_accounts
        self.where(demo: nil)
    end

end

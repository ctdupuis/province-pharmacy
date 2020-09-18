class User < ApplicationRecord
    has_secure_password
    before_save :username_to_caps

    validates :username, length: { maximum: 3 }

    def as_json(options={})
        super(only: [:id, :username, :admin])
    end 

    private

    def username_to_caps
        self.username = username.upcase
    end
end

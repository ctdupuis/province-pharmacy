class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post

    validates :content, presence: true

    def created
        self.created_at.in_time_zone('Central Time (US & Canada)').strftime("%m/%d/%y at%l:%M %P")
    end

    def updated
        self.updated_at.in_time_zone('Central Time (US & Canada)').strftime("%m/%d/%y at%l:%M %P")
    end

    def author
        User.find(self.user_id).username
    end
end

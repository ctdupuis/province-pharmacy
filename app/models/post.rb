class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy

    validates :content, presence: true

    def created
        self.created_at.strftime("%a %m/%e/%S %l:%e %P")
    end

    def updated
        self.updated_at.strftime("%a %m/%e/%S %l:%e %P")
    end

    def author
        User.find(self.user_id).username
    end
end

class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy

    validates :content, presence: true

    def created
        self.created_at.strftime("%a %m/%e/%S %l:%e %P %z")
    end

    def updated
        self.updated_at.strftime("%a %m/%e/%S %l:%e %p")
    end
end

class ConversationsSerializer

    def initialize(object)
        @conversation = object
    end

    def to_serialized_json
        options = {
            include: [:id, :title, :messages]
        }
    end
end
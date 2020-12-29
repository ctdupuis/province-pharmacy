class MessagesSerializer

    def initialize(object)
        @message = object
    end

    def to_serialized_json
        options = {
            include: [:id, :conversation_id, :text, :created_at]
        }
    end

end
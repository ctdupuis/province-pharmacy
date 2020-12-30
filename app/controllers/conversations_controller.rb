class ConversationsController < ApplicationController

    def create
        conversation = Conversation.new(conversation_params)
        if conversation.save
          serialized_data = ConversationsSerializer.new(conversation).to_serialized_json
          ActionCable.server.broadcast 'conversations_channel', serialized_data
          head :ok
        end
    end

    def index
        conversations = ConversationsSerializer.new(Conversation.all).to_serialized_json
        render json: conversations
    end

    private

    def conversation_params
        params.require(:conversation).permit(:title)
    end
end
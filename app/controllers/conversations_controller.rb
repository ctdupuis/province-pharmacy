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
        if @current_user.demo
            conversation = ConversationsSerializer.new(Conversation.find(2)).to_serialized_json
        else
            conversation = ConversationsSerializer.new(Conversation.find(1)).to_serialized_json
        end
        render json: conversation
    end

    private

    def conversation_params
        params.require(:conversation).permit(:title)
    end
end
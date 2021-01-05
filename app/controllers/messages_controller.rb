class MessagesController < ApplicationController
    
    def create
        if params[:user][:demo]
            conversation = Conversation.find(2)
        else
            conversation = Conversation.find(1)
        end
        message = Message.new(
            text: params[:text],
            user_id: params[:user][:id],
            conversation_id: conversation.id
        )
        # binding.pry
        if message.save
            serialized_data = MessagesSerializer.new(message).to_serialized_json
            MessagesChannel.broadcast_to conversation, serialized_data
            head :ok
        end
    end

end

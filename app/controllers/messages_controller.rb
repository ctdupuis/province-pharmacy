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
        if message.save
            serialized_data = MessagesSerializer.new(message).to_serialized_json
            MessagesChannel.broadcast_to conversation, serialized_data
            head :ok
        end
    end

    def index
        if @current_user.demo
            conversation = Conversation.find(2)
        else
            conversation = Conversation.find(1)
        end
        messages = MessagesSerializer.new(conversation.messages).to_serialized_json
        render json: messages
    end

    def destroy 
        Message.find(params[:id]).destroy
        render json: { status: 200 }
    end

    def destroy_all
        Message.destroy_all
    end

end

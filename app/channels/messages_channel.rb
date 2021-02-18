class MessagesChannel < ApplicationCable::Channel
  def subscribed
    if params[:demo]
      conversation = Conversation.find(2)
    else
      conversation = Conversation.find(1)
    end
    stream_for conversation
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

class MessagesChannel < ApplicationCable::Channel
  def subscribed
    # conversation = Conversation.find(1)
    stream_for conversation
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

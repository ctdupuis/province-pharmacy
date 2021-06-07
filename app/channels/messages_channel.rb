class MessagesChannel < ApplicationCable::Channel
  def subscribed
    conversation = get_convo(params[:demo])
    stream_for conversation
  end

  def speak(data) 
    Message.create!(
      text: params[:text],
      user_id: params[:user][:id],
      conversation_id: conversation.id
    )
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def get_convo(demo)
    if demo
      Conversation.find(2)
    else
      Conversation.find(1)
    end
  end
end

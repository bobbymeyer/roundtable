# frozen_string_literal: true

class ChatMessagesController < ApplicationController
  def create
    @chat_message = ChatMessage.new(chat_message_params)
    respond_to do |format|
      if @chat_message.save
        format.turbo_stream
        format.html { redirect_to chat_message_path(@chat_message) }
      end
    end
  end

  private

  def chat_message_params
    params.require(:chat_message).permit(:content, :user_id, :conversation_id)
  end
end

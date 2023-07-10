# frozen_string_literal: true

class ConversationsController < ApplicationController
  def new
    @conversation = Conversation.new(user_id: current_user.id)
  end

  def create
    @conversation = Conversation.new(conversation_params)
    respond_to do |format|
      if @conversation.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.prepend('conversations', partial: 'conversations/conversation',
                                                                     locals: { conversation: @conversation })
        end
        format.html { redirect_to conversation_path(@conversation) }
      end
    end
  end

  def show
    @conversation = Conversation.friendly.find(params[:id])
  end

  private

  def conversation_params
    params.require(:conversation).permit(:title, :user_id)
  end

  def slug_candidates
    [
      :title,
      [:title, :moderator_name]
    ]
  end
end

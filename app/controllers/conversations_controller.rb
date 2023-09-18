# frozen_string_literal: true

class ConversationsController < ApplicationController
  before_action :authenticate_invite!, only: %i[show]

  def new
    @conversation = Conversation.new(user_id: current_user.id)
  end

  def create
    @conversation = Conversation.new(conversation_params)
    @conversation.save
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to conversation_path(@conversation) }
    end
  end

  def show
    @conversation = Conversation.friendly.find(params[:id])
    @messages = @conversation.chat_messages.reverse
  end

  def destroy
    @conversation = Conversation.friendly.find(params[:id])
    @conversation.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to user_path(current_user), notice: 'Conversation was successfully deleted.' }
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:title, :user_id)
  end

  def authenticate_invite!
    @conversation = Conversation.friendly.find(params[:id])
    return if @conversation.moderator == current_user
    return if @conversation.users.include?(current_user)

    redirect_to root_path, notice: 'You are not invited to this conversation'
  end
end

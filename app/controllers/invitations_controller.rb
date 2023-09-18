# frozen_string_literal: true

class InvitationsController < ApplicationController
  def new
    @conversation = Conversation.friendly.find(params[:conversation_id])
    @invitation = Invitation.new(conversation_id: @conversation.id)
  end

  def create
    @invitation = Invitation.new(invitation_params)
    user = find_user(@invitation.user_lookup)

    if user
      @invitation.user_id = user.id
      @invitation.save
    else
      render turbo_stream: turbo_stream.replace('flash', partial: 'layouts/flash', locals: { notice: 'User Not Found' })
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:conversation_id, :user_lookup)
  end

  def find_user(query)
    User.find_by(email: query) || User.find_by(username: query)
  end
end

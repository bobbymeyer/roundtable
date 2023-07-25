# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id])
    @conversations = @user.conversations.order(updated_at: :desc) + @user.invited_conversations
  end
end

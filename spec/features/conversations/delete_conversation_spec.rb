# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Conversations', type: :feature do
  before(:each) do
    @user = FactoryBot.create(:user)
    sign_in @user
  end

  it 'invitee cannot delete a conversation', js: true do
    moderator = FactoryBot.create(:user, username: 'Invitee')
    conversation = FactoryBot.create(:conversation, title: 'Test Conversation', moderator: moderator)
    invitation = FactoryBot.create(:invitation, user: @user, conversation: conversation)
    expect(page).to_not have_button('❌')
  end

  it 'moderator can delete a conversation', js: true do
    conversation = FactoryBot.create(:conversation, user_id: @user.id)
    visit conversation_path(conversation)
    click_button '❌'
    expect { conversation.reload }.to raise_error(ActiveRecord::RecordNotFound)
  end
end

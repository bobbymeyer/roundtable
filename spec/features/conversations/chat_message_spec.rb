# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Chat Messages', type: :feature do
  before(:each) do
    @user = FactoryBot.create(:user)
    login_as(@user)
  end

  it 'Chat messages broadcast to correct conversation', js: true do
    conversation = FactoryBot.create(:conversation, title: 'Test Conversation', moderator: @user)
    visit conversation_path(conversation)
    sleep(1)
    FactoryBot.create(:chat_message, user: @user, conversation: conversation, content: 'Test Message')
    sleep(1)
    expect(page).to have_content('Test Message')
  end

  it 'Chat messages do not broadcast to incorrect conversation', js: true do
    right_conversation = FactoryBot.create(:conversation, title: 'Right Conversation', moderator: @user)
    wrong_conversation = FactoryBot.create(:conversation, title: 'Wrong Conversation', moderator: @user)
    visit conversation_path(wrong_conversation)
    sleep(1)
    FactoryBot.create(:chat_message, user: @user, conversation: right_conversation,
                                     content: 'Test Message')
    sleep(1)
    expect(page).not_to have_content('Test Message')
  end
end

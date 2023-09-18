# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Invitation', type: :feature do
  before(:each) do
    @user = FactoryBot.create(:user)
    sign_in @user
  end

  it 'a moderator can invite a user to the conversation', js: true do
    conversation = FactoryBot.create(:conversation, title: 'Test Conversation', moderator: @user)
    invitee = FactoryBot.create(:user, username: 'Invitee')
    visit conversation_path(conversation)
    click_link 'Invite Users'
    fill_in 'Username or Email', with: invitee.username
    click_button 'Create Invitation'
    expect(conversation.users).to include(invitee)
  end

  it 'an invited user can invite another user to the conversation', js: true do
    moderator = FactoryBot.create(:user, username: 'Moderator')
    conversation = FactoryBot.create(:conversation, title: 'Test Conversation', moderator: moderator)
    FactoryBot.create(:invitation, user: @user, conversation: conversation)
    invitee = FactoryBot.create(:user, username: 'Invitee')
    visit conversation_path(conversation)
    click_link 'Invite Users'
    fill_in 'Username or Email', with: invitee.username
    click_button 'Create Invitation'
    expect(conversation.users).to include(invitee)
  end

  it 'you cannot invite a user not on the platform', js: true do
    conversation = FactoryBot.create(:conversation, title: 'Test Conversation', moderator: @user)
    visit conversation_path(conversation)
    click_link 'Invite Users'
    fill_in 'Username or Email', with: 'bobby@bobbymeyer.com'
    click_button 'Create Invitation'
    expect(conversation.users.count).to eq(0)
  end
end

require 'rails_helper'

RSpec.describe 'Conversations have an invite list', type: :feature do
  before(:each) do
    @user = FactoryBot.create(:user)
    sign_in @user
  end

  it 'uninvited users cannot see it' do
    conversation = FactoryBot.create(:conversation, title: 'Test Conversation', slug: 'test-conversation')
    visit conversation_path(conversation)
    expect(page).not_to have_content('Test Conversation')
  end

  it 'invited users can see it' do
    conversation = FactoryBot.create(:conversation, title: 'Test Conversation', slug: 'test-conversation')
    invitation = FactoryBot.create(:invitation, user: @user, conversation: conversation)
    visit conversation_path(conversation)
    expect(page).to have_content('Test Conversation')
  end
end
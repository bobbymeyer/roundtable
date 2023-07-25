require 'rails_helper'

RSpec.describe 'Conversations', type: :feature do
  before(:each) do
    @user = FactoryBot.create(:user)
    sign_in @user
  end

  it 'can create a new conversation', js: true do
    visit user_path(@user)
    click_link 'New Conversation'
    fill_in 'Title', with: 'Test Conversation'
    click_button 'Create Conversation'
    expect(page).to have_content('Test Conversation')
  end
end
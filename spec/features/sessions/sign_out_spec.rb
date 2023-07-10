# Rspec test for sign up
require 'rails_helper'

RSpec.describe 'Sessions', type: :feature do
  before(:each) do
    @user = FactoryBot.create(:user)
    sign_in @user
  end

  it 'signs me out' do
    visit '/'
    expect(page).to have_content("#{@user.username}")
    click_button 'Log Out'
    expect(page).to_not have_content("#{@user.username}")
  end
end
# frozen_string_literal: true

# Rspec test for Log up
require 'rails_helper'

RSpec.describe 'Sessions', type: :feature do
  it 'Logs me in' do
    user = User.create(username: Faker::Internet.username, email: Faker::Internet.email, password: 'password')
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_content(user.username.to_s)
  end
end

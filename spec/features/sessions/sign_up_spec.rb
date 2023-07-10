# Rspec test for sign up
require 'rails_helper'

RSpec.describe 'Sessions', type: :feature do
  it 'signs me up' do
    username = Faker::Internet.username
    visit '/users/sign_up'
    fill_in 'Username', with: username
    fill_in 'Email', with: Faker::Internet.email
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content("#{username}")
  end
end
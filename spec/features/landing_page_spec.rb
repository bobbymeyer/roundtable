# frozen_string_literal: true

# Write RSPEC tests for the landing page

require 'rails_helper'

RSpec.describe 'Landing Page', type: :feature do
  describe 'GET /' do
    it 'has a welcome message' do
      visit '/'
      expect(page).to have_content('Welcome to')
    end
  end
end

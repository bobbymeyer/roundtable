# frozen_string_literal: true

include Warden::Test::Helpers

driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]
Capybara.server_host = 'localhost'

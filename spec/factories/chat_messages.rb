# frozen_string_literal: true

FactoryBot.define do
  factory :chat_message do
    user { FactoryBot.create(:user) }
    content { Faker::Lorem.sentence }
    conversation { FactoryBot.create(:conversation) }
    state { 1 }
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :conversation do
    title { Faker::Lorem.sentence }
    moderator { FactoryBot.create(:user) }
  end
end

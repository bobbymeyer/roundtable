FactoryBot.define do
  factory :invitation do
    user_id { Faker::Internet.email }
    conversation_id { FactoryBot.create(:conversation) }
  end
end

FactoryBot.define do
  factory :conversation do
    title { Faker::Lorem.sentence }
    user { FactoryBot.create(:user) }
  end
end

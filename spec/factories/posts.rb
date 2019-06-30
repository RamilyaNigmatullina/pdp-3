FactoryBot.define do
  factory :post do
    user

    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph(50) }
    state { "pending" }

    trait :published do
      state { "published" }
    end

    trait :rejected do
      state { "rejected" }
    end
  end
end

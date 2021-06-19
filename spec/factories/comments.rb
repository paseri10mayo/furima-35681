FactoryBot.define do
  factory :comment do
    
    c_text          { Faker::Lorem.sentence }

    association :user
    association :item
  end
end
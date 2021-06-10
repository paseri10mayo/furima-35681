FactoryBot.define do
  factory :item do

    name          { Faker::Lorem.sentence }

    text          { Faker::Lorem.sentence }

    price         {2000}

    categry_id    {1}

    condition_id  {1}

    charge_id     {1}

    shipment_id   {1}

    area_id{1}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/output-image1.png'), filename: 'output-image1.png')
    end
  end
end
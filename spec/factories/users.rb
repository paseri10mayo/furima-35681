FactoryBot.define do
  factory :user do
    
    nickname {Faker::Name.last_name}

    email {Faker::Internet.free_email}

    password {Faker::Lorem.characters(number: 10, min_alpha: 4, min_numeric: 1) }

    password_confirmation {password}

    first_name { Gimei.first.kanji }

    last_name { Gimei.last.kanji }

    first_name_kana { Gimei.first.katakana }

    last_name_kana { Gimei.last.katakana }

    birthday { Faker::Date.backward }
  end
end
FactoryBot.define do
  factory :order_information do

    postal_code {'123-4567'}

    area_id     {1}

    city        {'横浜市緑区'}

    address     {'青山1-1-1'}

    building    {'柳ビル１０３'}

    phone       {'09012345678'}

    token       {"tok_abcdefghijk00000000000000000"}

  end
  end
FactoryBot.define do
  factory :item do
    name                      {"テスト"}
    text                      {"テスト"}
    category_id               {2}
    condition_id              {2}
    shipping_cost_id          {2}
    prefecture_id             {2}
    days_to_ship_id           {2}
    price                     {300}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/sample.jpeg'), filename: 'sample.jpeg')
    end
  end
end

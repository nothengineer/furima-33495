FactoryBot.define do
  factory :buyer_order do
    postal_code      {"123-4567"} 
    prefecture_id    {2} 
    municipalities   {"全角"} 
    address          {"テスト"} 
    building_name    {"テスト"}
    phone_number     {"00000000000"} 
    token            {"tok_test_***********"}
    association :user
    association :item
  end
end

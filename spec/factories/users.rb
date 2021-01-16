FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    password {"1a" + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    familyname            {"山田"}
    firstname             {"太郎"}
    familyname_kana       {"ヤマダ"}
    firstname_kana        {"タロウ"}
    birthday              {"2000-01-01"}
  end
end
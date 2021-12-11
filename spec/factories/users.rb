FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)
    password {password}
    password_confirmation {password}
    last_name1 {"山田"}
    first_name1 {"太郎"}
    last_name2 {"ヤマダ"}
    first_name2 {"タロウ"}
    birthday {"2002-02-27"}
  end
end

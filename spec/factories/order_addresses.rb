FactoryBot.define do
  factory :order_address do
    postal_code { 1_234_567.to_s.insert(3, '-') }
    prefecture_id { 2 }
    municipalities { '横浜市緑区' }
    house_number { '青山1-1-1' }
    building { '柳ビル' }
    phone_number { "0#{rand(0..9)}0#{rand(1_000_000..99_999_999)}" }
    token { 'tok_***********' }
  end
end

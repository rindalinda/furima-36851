FactoryBot.define do
  factory :item do
    item_name { '漫画' }
    explain { 'これは漫画です' }
    category_id { 6 }
    status_id { 2 }
    charge_id { 2 }
    prefecture_id { 1 }
    send_day_id { 2 }
    price { 500 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

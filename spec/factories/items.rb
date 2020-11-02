FactoryBot.define do
  factory :item do
    name                { 'サンプル' }
    description         { 'サンプルです' }
    category_id         { '2' }
    status_id           { '2' }
    freight_id          { '2' }
    ship_region_id      { '2' }
    ship_date_id        { '2' }
    price               { '500' }
    association :user
  end
end

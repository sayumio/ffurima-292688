FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"kkk@gmail.com"}
    password              {"abc00000"}
    encrypted_password    {password}
    family_name           {"山田"}
    first_name            {"太郎"}
    kana_family_name      {"ヤマダ"}
    kana_first_name       {"タロウ"}
    birth_date            {"1990/01/01"}
  end
end
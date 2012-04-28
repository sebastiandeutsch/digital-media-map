# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company do
    name "9elements"
    description "Rockstars/Developers from Bochum"
    street "Bermuda"
    zip "50823"
    city "Bochum"
    email "rock@9elements.com"
  end
end

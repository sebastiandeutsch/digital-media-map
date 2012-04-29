# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company do
    name "9elements"
    description "Rockstars"
    street "Deutz-Muelheimerstr. 129"
    zip "51063"
    city "Koeln"
    email "team@railslove.com"
  end
end
FactoryGirl.define do
  factory :vote do
    name RandomData.random_name
    description RandomData.random_sentence
  end
end

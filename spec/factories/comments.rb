FactoryGirl.define do
  factory :comment do
    name RandomData.random_name
    description RandomData.random_sentence
  end
end

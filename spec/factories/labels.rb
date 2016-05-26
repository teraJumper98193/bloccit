FactoryGirl.define do
  factory :label do
    name RandomData.random_name
    description RandomData.random_sentence
  end
end

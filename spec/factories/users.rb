FactoryGirl.define do
  factory :user do
    state { Faker::Address.state }
  end
end

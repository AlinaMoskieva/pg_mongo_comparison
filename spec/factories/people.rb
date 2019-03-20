FactoryGirl.define do
  factory :person do
    state { Faker::Address.state }
  end
end

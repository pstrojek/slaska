FactoryGirl.define do
  factory(:user) do
    name "John Smith"
    provider "rspec"
    uid "12345678"
    # admin false
  end

  factory(:dinner) do
    sequence(:name) { |i| "Dinner_#{i}" }
  end

  factory(:order) do
    association :user
    # status :waiting
    dinners [ FactoryGirl.build(:dinner) ]
  end
end

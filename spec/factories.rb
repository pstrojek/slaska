FactoryGirl.define do
  factory(:user) do
    name "John Smith"
    provider "rspec"
    uid "12345678"
  end

  factory(:dinner) do
    sequence(:name) { |i| "Dinner_#{i}"}
  end

  factory(:order) do
    association :user
    dinners [FactoryGirl.build(:dinner)]
  end
end
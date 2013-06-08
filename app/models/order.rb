class Order
  include Mongoid::Document
  has_and_belongs_to_many :dinners, inverse_of: nil
end

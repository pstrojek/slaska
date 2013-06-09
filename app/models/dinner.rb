class Dinner
  include Mongoid::Document
  field :name, type: String

  validates :name, length: { in: 3..100 }, uniqueness: true
end

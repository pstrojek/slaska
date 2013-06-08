class Order
  include Mongoid::Document
  field :status, type: Symbol, default: :waiting
  has_and_belongs_to_many :dinners, inverse_of: nil

  validates :status, inclusion: {in: [:waiting, :not_sent, :sent]}

  belongs_to :user
end

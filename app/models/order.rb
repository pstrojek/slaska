class Order
  include Mongoid::Document
  field :status, type: Symbol, default: :waiting
  has_and_belongs_to_many :dinners, inverse_of: nil
  belongs_to :user

  validates :status, inclusion: { in: [:waiting, :not_sent, :sent] }
  validates :user, presence: true

  validate :validate_at_least_one_dinner

  protected

  def validate_at_least_one_dinner
    errors.add(:dinners, "Order must have at least one dinner") if dinners.empty?
  end
end

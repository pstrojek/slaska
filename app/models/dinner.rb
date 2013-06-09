class Dinner
  include Mongoid::Document
  field :name, type: String

  validates :name, length: { in: 3..100 }, uniqueness: true

  def to_s
    name
  end

  def self.get_top(limit = 10)
    Order.all.flat_map(&:dinners)
      .group_by(&:id)
      .map{|k,list| [list.count, list.first]}
      .sort_by(&:first)
      .reverse
      .map(&:last)
      .take(limit)
  end
end

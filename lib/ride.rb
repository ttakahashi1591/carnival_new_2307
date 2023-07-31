require './lib/visitor'

class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :rider_log

  def initialize(attributes)
    @name = attributes[:name]
    @min_height = attributes[:min_height]
    @admission_fee = attributes[:admission_fee]
    @excitement = attributes[:excitement]
    @rider_log = Hash.new({})
  end

  def total_revenue
    @rider_log.values.sum * @admission_fee
  end

  def board_rider(visitor)
    return false unless can_board?(visitor) 

    reduce_spending_money(visitor)
    update_rider_log(visitor)
    true
  end

  def can_board?(visitor)
    visitor.height >= @min_height &&
      visitor.spending_money >= @admission_fee &&
      visitor.preferences.include?(@excitement)
  end

  # def update_rider_log(visitor)
  #   @rider_log[visitor] ||= 0
  #   @rider_log[visitor] += 1
  # end
end
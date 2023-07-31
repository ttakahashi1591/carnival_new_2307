class Visitor
  attr_reader :name,
              :height,
              :spending_money,
              :preferences
  
  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money.gsub(/\D/, '').to_i
    @preferences = []
  end

  def add_preference(ride_preference)
    @preferences << ride_preference
  end

  def tall_enough?(height)
    @height >= 54
  end
end
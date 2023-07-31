require 'pry'
require './lib/visitor'
require './lib/ride'

RSpec.describe Ride do
  before(:each) do
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
  end

  describe '#initialize' do
    it 'exists and has attributes' do
      expect(@ride1).to be_an_instance_of(Ride)
      expect(@ride1.name).to eq("Carousel")
      expect(@ride1.min_height).to eq(24)
      expect(@ride1.admission_fee).to eq(1)
      expect(@ride1.excitement).to eq(:gentle)
      expect(@ride1.rider_log).to eq({})
    end
  end

  describe '#total_revenue' do
    it 'determines total revenue from ride' do
      expect(@ride1.total_revenue).to eq(0)
    end
  end

  describe '#board_rider' do
    it 'adds a rider to the ride' do
      expect(@ride1.rider_log).to eq({})

      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)

      expect(@ride1.rider_log).to be_a Hash
    end
  end

  describe '#can_board?' do
    it 'determines if a visitor can board a specific ride' do
      expect(@ride1.can_board?(@visitor1)).to eq(false)
      expect(@ride1.can_board?(@visitor2)).to eq(false)

      @visitor1.add_preference(:gentle)
      @visitor2.add_preference(:gentle)

      expect(@ride1.can_board?(@visitor1)).to eq(true)
      expect(@ride1.can_board?(@visitor2)).to eq(true)
    end
  end

  describe '#reduce_spending_money' do
    it 'reduces visitors spending money upon boarding' do
      expect(@visitor1.spending_money).to eq(10)

      @ride1.board_rider

      expect(@visitor1.spending_money).to eq(9)
    end
  end

  # describe '#update_ride_log' do
  #   it 'updates the amount of riders in log' do
  #     @ride1.board_rider(@visitor1)

  #     expect(@ride1.update_rider_log(@visitor1)).to eq(1)
  #   end
  # end
end
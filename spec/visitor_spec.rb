require 'pry'
require './lib/visitor'

RSpec.describe Visitor do
  before(:each) do
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
  end

  describe '#initialize' do
    it 'exists and has attributes' do
      expect(@visitor1).to be_an_instance_of(Visitor)
      expect(@visitor1.name).to eq("Bruce")
      expect(@visitor1.height).to eq(54)
      expect(@visitor1.spending_money).to eq(10)
    end
  end

  describe '#add_preference' do
    it 'determines a visitors ride preference' do
      expect(@visitor1.preferences).to eq([])

      @visitor1.add_preference(:gentle)
      @visitor1.add_preference(:thrilling)

      expect(@visitor1.preferences).to eq([:gentle, :thrilling])
    end
  end

  describe '#tall_enough' do
    it 'determines if a visitor is tall enough for ride' do
      expect(@visitor1.tall_enough?(54)).to eq(true)
      expect(@visitor2.tall_enough?(36)).to eq(false)
      expect(@visitor3.tall_enough?(64)).to eq(true)
    end
  end
end
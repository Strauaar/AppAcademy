require 'rspec'
require 'card'

RSpec.describe Card do
  let(:card) { Card.new(13, :hearts) }
  describe "#initialize" do
    it "should have a value" do
      expect(card.value).to eq(13)
    end
    it "should have a suit" do
      expect(card.suit).to eq(:hearts)
    end

  end

end

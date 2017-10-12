require 'rspec'
require 'hand'

RSpec.describe Hand do

  let(:object) { Hand.new(Deck.new) }
  let(:deck) { double("deck", ) }

  describe "#initialize" do

    it "creates an empty hand" do
      expect(object.hand).to be_empty
    end

    it "raise error if not passed a deck object" do

      expect { Hand.new("deck") }.to raise_error(ArgumentError)
    end

  end

  describe "#deal_hand" do
    before(:each) do
      object.deal_hand
    end
    it "populates hand array with 5 cards" do
      expect(object.hand.size).to eq(5)
    end

    it "subtracts the hand from the deck" do
      full_hand = object.hand.map { |card| [card.suit, card.value] }
      partial_deck = object.deck.map { |card| [card.suit, card.value]}
      expect(partial_deck).to_not include(*full_hand)
    end

  end

  describe "#check_hand" do

    context "check for valid hand" do

      it "will return royal flush"

      it "will return straight flush"

      it "will return 4-of-a-kind"

      it "will return full house"

      it "will return flush"

      it "will return straight"

      it "will return 3-of-a-kind"

      it "will return 2 pair"

      it "will return pair"

      it "will return highest value"

    end

  end
end

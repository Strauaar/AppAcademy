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

      it "will return royal flush" do
        royal_flush = (10..14).map { |value| Card.new(:hearts, value) }
        expect(check_hand(royal_flush)).to eq(:royal_flush)
      end

      it "will return straight flush" do
        straight_flush = (9..13).map { |value| Card.new(:hearts, value) }
        expect(check_hand(straight_flush)).to eq(:straight_flush)
      end

      it "will return 4-of-a-kind" do
        four_of_a_kind =  [ Card.new(:hearts, 9), Card.new(:diamonds, 9),
                            Card.new(:spades, 9), Card.new(:clubs, 9),
                            Card.new(:hearts, 5) ]

        expect(check_hand(four_of_a_kind)).to eq(:four_of_a_kind)
      end

      it "will return full house" do
        full_house = [ Card.new(:hearts, 9), Card.new(:diamonds, 9),
                       Card.new(:spades, 9), Card.new(:clubs, 5),
                       Card.new(:hearts, 5) ]
        expect(check_hand(full_house)).to eq(:full_house)
      end

      it "will return flush" do
        flush = [ Card.new(:hearts, 6), Card.new(:hearts, 7),
                  Card.new(:hearts, 9), Card.new(:hearts, 5),
                  Card.new(:hearts, 14) ]
        expect(check_hand(flush)).to eq(:flush)
      end

      it "will return straight" do
        straight = [ Card.new(:hearts, 2), Card.new(:hearts, 3),
                     Card.new(:spades, 4), Card.new(:hearts, 5),
                     Card.new(:hearts, 6) ]
        expect(check_hand(straight)).to eq(:straight)
      end

      it "will return 3-of-a-kind" do
        three_of_a_kind = [ Card.new(:hearts, 9), Card.new(:diamonds, 9),
                            Card.new(:spades, 9), Card.new(:clubs, 8),
                            Card.new(:hearts, 5) ]
        expect(check_hand(three_of_a_kind)).to eq(:three_of_a_kind)
      end

      it "will return 2 pair" do
        two_pair = [ Card.new(:hearts, 8), Card.new(:diamonds, 9),
                     Card.new(:spades, 9), Card.new(:clubs, 5),
                     Card.new(:hearts, 5) ]
        expect(check_hand(two_pair)).to eq(:two_pair)
      end

      it "will return pair" do
        pair = [ Card.new(:hearts, 8), Card.new(:diamonds, 9),
                     Card.new(:spades, 7), Card.new(:clubs, 5),
                     Card.new(:hearts, 5) ]
        expect(check_hand(pair)).to eq(:pair)
      end

      it "will return highest value" do
        trash = [ Card.new(:hearts, 14), Card.new(:diamonds, 9),
                     Card.new(:spades, 7), Card.new(:clubs, 4),
                     Card.new(:hearts, 5) ]
        expect(check_hand(trash)).to eq(:trash)
      end

    end

  end
end

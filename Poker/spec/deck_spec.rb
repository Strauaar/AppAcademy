require 'rspec'
require 'deck'

RSpec.describe Deck do
  let(:deck) { Deck.new.deck }
  describe "#initialize" do

    it "should be a size of 52" do
      expect(deck.size).to eq(52)
    end

    it "should contain 4 suits" do
      suits_array = deck.map { |card| card.suit }.uniq
      expect(suits_array.size).to eq(4)
    end

    it "should contain 13 unique cards of each suit" do
      hearts = deck.select {|card| card.suit == :hearts}.map(&:value)
      spades = deck.select {|card| card.suit == :spades}.map(&:value)
      clubs = deck.select {|card| card.suit == :clubs}.map(&:value)
      diamonds = deck.select {|card| card.suit == :diamonds}.map(&:value)

      expect(hearts.uniq.size).to eq(13)
      expect(spades.uniq.size).to eq(13)
      expect(clubs.uniq.size).to eq(13)
      expect(diamonds.uniq.size).to eq(13)
    end

    it "should only contain instances of the card class" do
      expect(deck).to all( be_an_instance_of(Card))
    end


  end




end

require 'deck.rb'

class Hand
  attr_accessor :hand, :deck
  def initialize(deck)
    @hand = []
    raise ArgumentError if deck.class != Deck
    @deck = deck.deck
  end

  def deal_hand
    until @hand.size == 5
      @hand << @deck.shift
    end
  end
end

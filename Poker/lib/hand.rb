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

  def check_hand(hand)
    return :royal_flush if royal_flush?(hand)
    return :straight_flush if straight_flush?(hand)
    return :four_of_a_kind if four_of_a_kind?(hand)
    return :full_house if full_house?(hand)
    return :flush if flush?(hand)
    return :straight if straight?(hand)
    return :three_of_a_kind if three_of_a_kind?(hand)
    return :two_pair if two_pair?(hand)
    return :pair if pair?(hand)
    return :trash if trash?(hand)

  end

  def royal_flush?(hand)
    
  end



end

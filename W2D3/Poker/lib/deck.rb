require 'card.rb'

class Deck

  attr_accessor :deck

  def initialize
    @deck = []
    populate
    shuffle!
  end

  def populate
    suits = [:hearts, :diamonds, :clubs, :spades]
    suits.each do |suit|
      (2..14).each do |value|
        @deck << Card.new(suit, value)
      end
    end

  end

  def shuffle!
    @deck.shuffle!
  end

end

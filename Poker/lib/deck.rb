class Deck

  def initialize
    @deck = []
    populate
  end

  def populate
    suits = [:hearts, :diamonds, :clubs, :spades]
    suits.each do |suit|
      (2..14).each do |value|
        @deck << Card.new(suit, value)
      end
    end

  end

end

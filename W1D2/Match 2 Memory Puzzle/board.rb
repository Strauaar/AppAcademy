class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(5) { Array.new(6) }
    populate
  end

  def populate
    cards = []
    (1..15).each do |i|
      card = Card.new(i)
      cards << card
      cards << card.dup
    end
    cards.shuffle!
    # until is_full?
    #   # i, j = rand(0..4), rand(0..5)
    #   # o, l = rand(0..4), rand(0..5)
    #
    #   if !grid[i][j] && !grid[o][l]
    #     @grid[i][j] = cards.pop
    #     @grid[o][l] = cards.pop
    #   end
    (0..4).to_a.each do |i|
       (0..5).to_a.each do |j|
        @grid[i][j] = cards.pop
      end
    end

  end

  def is_full?
    @grid.each do |i|
      if i.include?(nil)
        return false
      end
    end
    true
  end

  def render
    system("clear")
    # result = []
    # @grid.each do |i|
    #   result << i.map do |card|
    #     if card.flipped
    #       card.value
    #     else
    #       "-"
    #     end
    #   end
    # end
    # result.each do |i|
    #   p i
    # end

    puts render_index
    @grid.each_with_index do |row, i|
      puts "#{i} #{row.map {|card| card.value unless card.flipped == false}.join(" ")}"
    end
  end

  def render_index
    index = " "
    one = []
    @grid.each_with_index do |row, i|
      row.each_with_index do |card, j|
        one << j
        if card.value > 9 && card.flipped == true
          index << " #{j}" if one.count(j) < 2
        else
          index << "#{j}" if one.count(j) < 2
        end
      end
    end
    index
  end

end

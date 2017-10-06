require_relative 'tile'

class Board

  attr_accessor :arr_bomb, :grid

  def initialize
    @grid = Array.new(9) {
      Array.new(9) { Tile.new(false) }
    }
    scatter_bombs
  end

  def scatter_bombs
    @arr_bomb = []
    until arr_bomb.size == 10
      i = rand(0..8)
      j = rand(0..8)
      next if @arr_bomb.include?([i, j])
      @grid[i][j] = Tile.new(true)
      @arr_bomb << [i, j]
    end
  end

  def reveal(pos)
    x, y = pos
    @grid[x][y].reveal unless @grid[x][y].is_flagged
  end

  def render
    @grid.each.with_index do |row, i|
      row.each.with_index do |tile, j|
        if tile.revealed
          print adjacent_count(i, j) == " 0 "  ? " - " : adjacent_count(i, j).to_s
        elsif tile.is_flagged
          print " F "
        else
          print " * "
        end
      end
      puts ""
    end
  end

  def flag_tile(pos)
    x, y = pos
    @grid[x][y].flag
  end

  def adjacent_count(i, j)
    count = 0
    for x in (i-1..i+1)
      for y in (j-1..j+1)
        next if @grid[x][y] == nil
        count += 1 if @arr_bomb.include?([x,y])
      end
    end
    " #{count} "
  end

  def play(pos, action)
    x = pos[0]
    y = pos[1]
    tile = @grid[x][y]
    if action == "f"
      raise "Invalid move" if tile.revealed
      tile.is_flagged ? tile.unflag : tile.flag
    elsif action == "r"
      tile.reveal
    end
  end

end

require_relative 'tile'
require 'byebug'
class Board

  attr_accessor :arr_bomb, :grid, :lost, :tile_map_bombs, :tile_map_reveals

  def initialize
    @lost = false
    @grid = Array.new(9) {
      Array.new(9) { Tile.new(false) }
    }
    scatter_bombs
    make_tile_hash
    @tile_map_reveals = Hash.new { |h,k| h[k] = 0 }
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
          if tile.is_bomb
            print " B "
          else
            print adjacent_bomb_count(i, j) == " 0 "  ? " - " : adjacent_bomb_count(i, j).to_s
          end
        elsif tile.is_flagged
          print " F "
        elsif tile.is_bomb
          print " b "
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

  def adjacent_bomb_count(i, j)
    count = 0
    low_x = (i == 0 ? 0 : (i-1))
    low_y = (j == 0 ? 0 : (j-1))

    high_x = (i == 8 ? 8 : (i+1))
    high_y = (j == 8 ? 8 : (j+1))


    for x in (low_x..high_x)
      for y in (low_y..high_y)
        next if x == i && y == j
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
      if tile.is_bomb
        @lost = true
      else
        map_tile_reveals(x,y)
        reveal_adjacent(x,y) unless @tile_map_bombs[[x,y]] > 0

      end
    end
  end

  def reveal_adjacent(i, j)
    debugger
    return [] if @tile_map_bombs[[i,j]] > 0

    low_x = (i == 0 ? 0 : (i-1))
    low_y = (j == 0 ? 0 : (j-1))

    high_x = (i == 8 ? 8 : (i+1))
    high_y = (j == 8 ? 8 : (j+1))

    tile_indices = @tile_map_bombs.keys
    index = []
    for x in (low_x..high_x)
      for y in (low_y..high_y)
        next if @grid[x][y].revealed
        reveal_adjacent(x,y) unless @tile_map_bombs[[x,y]] >= 1
      end
    end
  end

  #TODO Push all indexes to be revealed into an array and set reveal value to true

  def make_tile_hash
    @tile_map_bombs = {}
    for i in (0..8)
      for j in (0..8)
        @tile_map_bombs[[i,j]] = adjacent_bomb_count(i,j).to_i
      end
    end
  end

  def map_tile_reveals(i,j)
    low_x = (i == 0 ? 0 : (i-1))
    low_y = (j == 0 ? 0 : (j-1))

    high_x = (i == 8 ? 8 : (i+1))
    high_y = (j == 8 ? 8 : (j+1))

    for x in (low_x..high_x)
      for y in (low_y..high_y)
        next if x == i && y == j
        @tile_map_reveals[[x,y]] += 1
      end
    end

  end
  # def tile_map_reveals
  #   # @tile_map_reveals = {}
  #   # for i in (0..8)
  #   #   for j in (0..8)
  #   #     @tile_map_reveals[[i,j]] = adjacent_reveal_count(i,j).to_i
  #   #   end
  #   # end
  #
  #
  # end

  def adjacent_reveal_count(i, j)
    count = 0
    low_x = (i == 0 ? 0 : (i-1))
    low_y = (j == 0 ? 0 : (j-1))

    high_x = (i == 8 ? 8 : (i+1))
    high_y = (j == 8 ? 8 : (j+1))

    for x in (low_x..high_x)
      for y in (low_y..high_y)
        next if x == i && y == j
        count += 1 if @grid[x][y].revealed
      end
    end

    count

  end

end

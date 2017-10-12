require_relative "tile"
require 'byebug'

class Board
  attr_reader :grid

  def self.empty_grid
    Array.new(9) do
      Array.new(9) { Tile.new(0) }
    end
  end

  def self.from_file(filename)
    rows = File.readlines(filename).map(&:chomp)
    tiles = rows.map do |row|
      nums = row.split("").map { |char| char.to_i }
      nums.map { |num| Tile.new(num) }
    end

    self.new(tiles)
  end

  def initialize(grid = self.empty_grid)
    @grid = grid
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, new_value)
    x, y = pos
    tile = grid[x][y]
    tile.value = new_value
  end

  def columns
    grid.transpose
  end

  def render
    print "  #{(0..8).to_a.join(" ")}\n"
    grid.each_with_index do |row, i|
      puts "#{i} #{row.join(" ")}"
    end
  end


  def size
    grid.size
  end



  def solved?
    grid.all? { |row| solved_set?(row) } &&
      columns.all? { |col| solved_set?(col) } &&
      squares.all? { |square| solved_set?(square) }
  end

  def solved_set?(tiles)
    nums = tiles.map(&:value)
    nums.sort == (1..9).to_a
  end

  def square(idx)
    tiles = []
    x = (idx / 3) * 3
    y = (idx % 3) * 3

    (x..x + 2).each do |j|
      (y..y + 2).each do |i|
        tiles << self[[i, j]]
      end
    end

    tiles
  end

  def squares
    (0..8).to_a.map { |i| square(i) }
  end

end

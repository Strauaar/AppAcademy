require_relative 'board'

class Game
  attr_accessor :board

    def initialize
      @board = Board.new
    end

    def run
      render
      until @board.lost
        make_play
        render
      end
      puts "You lost"
    end

    def get_position
      position = nil
      until position && position_valid?(position)
        puts "Enter a position to take an action at:"
        position = parse_pos(gets.chomp)
      end
      position
    end

    def get_action
      action = nil
      until action && action_valid?(action)
        puts "Enter an action: (r, f)"
        action = gets.chomp
      end
      action.downcase
    end

    def make_play
      pos = get_position
      action = get_action
      begin @board.play(pos, action)
      rescue
        retry
        pos = get_position
        action = get_action
      end
    end

    def parse_pos(pos)
      pos.split(",").map(&:to_i)
    end

    def position_valid?(pos)
      pos.all? {|num| num.between?(0,8) }
    end

    def action_valid?(action)
      action = action.downcase
      action == "r" || action == "f"
    end

    def render
      system("clear")
      @board.render
    end

end

game = Game.new
game.run

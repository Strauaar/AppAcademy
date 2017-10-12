require_relative "Player.rb"
require_relative "AiPlayer.rb"

class Game
  attr_accessor :fragment, :players, :dictionary

  def initialize(players, dictionary = File.readlines("dictionary.txt").map(&:chomp))
    @players = players
    @dictionary = dictionary
    @fragment = ""
  end

  def play_round
    until won?
      @players.each do |player|
        puts "Enter a letter, #{player.name}"
        fragment << take_turn(player)
        puts "Word: #{fragment}"
        puts ""
        if @dictionary.include?(fragment)
          @fragment = ""
          player.add_letter
          @players.each {|player| puts "#{player.name} : #{player.record}"}
          puts ""
          @players.delete(player) if player.lost?
        end
      end
    end
  end

  def take_turn(player)
    play = player.get_play(@fragment,@players)
    until valid_play?(play)
      puts "Enter valid letter:"
      play = player.get_play(@fragment,@players)
    end
    play
  end

  def valid_play?(char)
    ("a".."z").to_a.include?(char) && @dictionary.any? do |word|
      word[0...(fragment + char).length] == fragment + char
    end
  end


  def won?
    @players.count == 1

  end

end

if __FILE__ == $PROGRAM_NAME
  player1 = Player.new("Jon")
  #player2 = Player.new("Aaron")
  #player3 = Player.new("Donald")
  player4 = AiPlayer.new("Terminator")
  players = [player1,player4]
  game = Game.new(players)
  game.fragment = "hellbe"
  game.play_round
end



class Player
  attr_accessor :name, :record

  def initialize(name, _dictionary = nil)
    @name = name
    @record = ""
  end

  def get_play(_fragment,_players)
    puts "Enter letter:"
    gets.chomp[0]
  end

  def add_letter
    ghost = "GHOST"
    @record += ghost[record.length]
  end

  def lost?
    @record == "GHOST"
  end
end

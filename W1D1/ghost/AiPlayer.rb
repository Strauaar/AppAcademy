class AiPlayer
  attr_accessor :name, :dictionary, :record

  def initialize(name, dictionary = File.readlines("dictionary.txt")
      .map(&:chomp))
    @name = name
    @dictionary = dictionary
    @record = ""
  end

  def get_play(fragment, players)

    choices = @dictionary.select do |word|
      word[0...(fragment).length] == fragment
    end

    if choices.all? {|word| word.length == fragment.length + 1}
      choices.sample[fragment.length]
    else
      choices = choices.select do |word|
        word.length - fragment.length != players.length + 1 &&
        word.length != fragment.length + 1
      end
      choices.sample[fragment.length]
    end
  end


  def add_letter
    ghost = "GHOST"
    @record += ghost[record.length]
  end


  def lost?
    @record == "GHOST"
  end

end

class AiPlayer
  attr_accessor :board, :known_cards, :matched_cards

  def add_board(board)
    @board = board
    @known_cards = Hash.new
    @matched_cards = Array.new
  end

  def take_turn
    puts "Press enter for a move"
    gets.chomp

      if @known_cards.values != @known_cards.values.uniq
        array = []
        @known_cards.each do |k, v|
          array << k if @known_cards.values.count(v) > 1
        end
        move1 = array[0]
        move2 = array[1]
        @board.grid[move1[0]][move1[1]].reveal
        display
        puts ""
        puts "Press enter to continue for next move"
        gets.chomp

        @board.grid[move2[0]][move2[1]].reveal
        display
        @matched_cards << move1
        @matched_cards << move2
        @known_cards.delete(move1)
        @known_cards.delete(move2)
        check_match(move1[0], move2[0], move1[1], move2[1])
      else

          x1, y1 = random_move
          @known_cards[[x1, y1]] = @board.grid[x1][y1].value
          @board.grid[x1][y1].reveal
          display
          puts ""
          puts "Press enter to continue for next move"
          gets.chomp

          if @known_cards.values != @known_cards.values.uniq
            array = []
            @known_cards.each do |k, v|
              array << k if @known_cards.values.count(v) > 1 && k != [x1, y1]
            end
            move2 = array[0]
            x2 = move2[0]
            y2 = move2[1]
            @board.grid[x2][y2].reveal
            display
            @matched_cards << move2
            @matched_cards << [x1,y1]
            @known_cards.delete([x1,y1])
            @known_cards.delete(move2)

          else
            x2, y2 = random_move
            @known_cards[[x2, y2]] = @board.grid[x2][y2].value
            @board.grid[x2][y2].reveal
            display
          end

        check_match(x1, x2, y1, y2)
        display
        puts "Ready for another pair" unless @board.is_full?

      end

    end




  def random_move
    pos = [0,0]
    until valid_input?(pos)
      i = rand(0..4)
      j = rand(0..5)
      pos = [i, j]
    end
    pos
  end

  def check_match(x1, x2, y1, y2)
    if !(@board.grid[x1][y1].value == @board.grid[x2][y2].value)
      puts "Not a match"
      @board.grid[x1][y1].hide
      @board.grid[x2][y2].hide
    else
      puts "It's a match"
    end
    sleep(0.4)
    puts ""
    sleep(0.4)
    # time = Time.new
    # until (Time.new - time >= 1)
    #   display
    #
    #   t = Time.new - time
    #   puts "Wait #{(1 - t).round(2)}"
    #   sleep(0.02)
    # end
  end

  def display
    @board.render
  end

  def valid_input?(pos)
    return false if @matched_cards.include?(pos)
    return false if @known_cards.keys.include?(pos)
    return false if @board.grid[pos[0]][pos[1]].flipped == true
    true
  end


end

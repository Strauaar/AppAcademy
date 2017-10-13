require 'byebug'
def my_uniq(array)
  result =[]
  array.each do |el|
    result << el unless result.include?(el)
  end
  result
end

class Array

  def two_sum
    result = []

    each_with_index do |el1, i|
      each_with_index do |el2, j|
        if (el1 + el2) == 0 && (i != j)
          result << [i, j].sort unless result.include?([i, j].sort)
        end
      end
    end
    result
  end

end

def my_transpose(arr)
  arr.each do |row|
    raise ArgumentError if row.size != arr.size
  end

  result = Array.new(arr.size) { Array.new }
  arr.each_with_index do |row, i|
      row.each_with_index do |col, j|
        result[j] << col
      end
  end

  result
end

def stock_picker(arr)
  ans = nil
  max_diff = 0
  for i in 0...arr.length
    for j in i...arr.length
      if (arr[j] - arr[i]) > max_diff
        max_diff = arr[j] - arr[i]
        ans = [i, j]
      end
    end
  end
  ans


end

class Hanoi

  def initialize
    @stack1 = [1,2,3]
    @stack2 = [nil, nil, nil]
    @stack3 = [nil, nil, nil]
    @fullstack = [@stack1, @stack2, @stack3].transpose

  end

  def parse_pos(stack_number)
    case stack_number
    when 1
      @stack1
    when 2
      @stack2
    when 3
      @stack3
    end
  end

  def get_input
    puts "Enter stack you want to move from (Hint: 1, 2, or 3)"
    from = gets.chomp.to_i
    raise "something for now" if !(1..3).include?(from)
    puts "Enter stack you want to move to (Hint: 1, 2, or 3)"
    to = gets.chomp.to_i
    raise "something for now" if !(1..3).include?(from)
    [from, to]
  end

  def valid_move?(from_stack, to_stack)
    return true if to_stack.all?(&:nil?)

    from_disc = take_from(from_stack)

    return false if from_disc.nil?

    to_stack_piece = nil
    to_stack.each do |disc|
      to_stack_piece = disc
      break if !to_stack_piece.nil?
    end

    return true if from_disc < to_stack_piece
    false

  end

  def take_from(stack)
    stack.each do |disc|
      return disc if !disc.nil?
    end
    return nil
  end

  def render
    @fullstack.each do |row|
      row.each do |el|
        if el.nil?
          puts "   "
        else
          puts " #{el} "
        end
      end
      puts ''
    end
  end

  def moves_disc(from_disc, from_stack, to_stack)
    idx = -1
    to_stack.each_with_index do |pos, i|
      idx = i if !pos.nil?
      break if !pos.nil?
    end
    idx = idx - 1
    debugger
    to_stack[idx] = from_disc
    from_stack[from_stack.index(from_disc)] = nil
  end

  def play_round
    from, to = get_input

    from_stack = parse_pos(from)
    to_stack = parse_pos(to)

    if valid_move?(from_stack, to_stack)
      from_disc = take_from(from_stack)
      moves_disc(from_disc, from_stack, to_stack)
    end

    render
  end

  def play

    until won?
      play_round
    end

  end

  def won?
    if @stack2 == [1,2,3] || @stack3 == [1,2,3]
      return true
    else
      false
    end
  end

end

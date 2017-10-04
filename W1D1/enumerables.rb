class Array

  def my_each(&prc)
    idx = 0
    while idx < self.length
      yield self[idx]
      idx += 1
    end
    self
  end




  def my_select(&prc)
    result = []
    self.my_each do |ele|
      result << ele if prc.call(ele)
    end

    result
  end

  def my_reject(&prc)
    result = []
    self.my_each do |ele|
      result << ele if !prc.call(ele)
    end

    result
  end


  def my_any?(&prc)
    self.my_each do |ele|
      return true if prc.call(ele)
    end

    false
  end

  def my_all?(&prc)
    self.my_each do |ele|
      return false if !prc.call(ele)
    end

    true
  end

  def my_flatten
    result = []
    self.my_each do |ele|
      if ele.class == Array
        result += ele.my_flatten
      else
        result << ele
      end
    end
    result
  end

  def my_zip(*args) #self = [1,2,3] #args = [[1,2,3], [2,3,4]]
    result = []
    i = 0
    while i < self.length
      j = 0
      result << [self[i]]
      while j < args.length
        result[i] << args[j][i]
        j += 1
      end
      i += 1
    end
    result
  end



  def my_rotate(idx = 1)
    # idx = self.length + idx if idx < 0
    # idx = idx % self.length
    # dup_arr = self.dup
    # val = dup_arr.shift(idx)
    # result = dup_arr + val
    # result

    split_idx = idx % self.length
    self.drop(split_idx) + self.take(split_idx)

  end

  def my_join(separator = '')
    result = ''
    self.each_with_index do |ele, i|
      if i == self.length - 1
        result << ele
      else
        result << "#{ele}#{separator}"
      end
    end
    result
  end

  def my_reverse
    result = []
    idx = self.length - 1
    while idx >= 0
      result << self[idx]
      idx -= 1
    end
    result
  end
end

# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end

# p return_value
#
#
#
# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []
#
# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]
#
#
#
# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]p
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]
#
# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

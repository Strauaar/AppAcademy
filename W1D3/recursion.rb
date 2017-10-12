def range(i_start, i_end)
  return [] if i_end == i_start
  [i_start] + range(i_start + 1, i_end)
end

def iterative_range(i_start, i_end)
  result = []
  (i_start...i_end).to_a.each do |num|
    result << num
  end
  result
end

def exp(b, n)
  return 1 if n == 0
  b * exp(b, n-1)
end

def exp2(b, n)
  return 1 if n == 0
  if n.odd?
    val = (exp2(b, (n - 1) / 2))
    b * val * val
  else
    val = exp2(b, n / 2)
    val * val
  end
end

class Array

  def deep_dup


    self.map do |el|
      if el.is_a?(Array)
        el.deep_dup
      else
        el
      end
    end


  end

  def deep_dup2
    result = []

    self.each do |el|
      if el.is_a?(Array)
        result << el.deep_dup2
      else
        result << el
      end

    end
    result


  end
end

def fib(n)
  return 0 if n < 0
  return 1 if n < 3
  fib(n-1) + fib(n-2)
end

def subsets(arr)
  return [[]] if arr.length == 0
  first_numbers = arr[0...-1]
  last_number = arr.last

  previous_subsets = subsets(first_numbers)
  new_subsets = []
  previous_subsets.each do |subset|
    new_subsets << subset + last_number
  end
  previous_subsets + new_subsets

  #subs = subsets(arr[0...-1])
  #subs + subs.map{|el| el + [arr.last]}
end

def permutations(arr)
  return [[]] if arr.length == 0
  last_number = arr[-1]
  first_numbers = arr[0...-1]
  prev_permutations = permutations(first_numbers)
  result = []
  num_inserts = prev_permutations[0].size + 1
  prev_permutations.each do |perm_array|
    num_inserts.times do |i|
      perm_array2 = perm_array.dup
      result << perm_array2.insert(i, last_number)
    end
  end
  result
end


def bsearch(arr,target)

  mid_idx = arr.length/2
  return nil if arr.all? {|num| num != target}
  return mid_idx if arr[mid_idx] == target
  #check right side
  if target > arr[mid_idx]
    mid_idx + bsearch(arr[mid_idx..-1], target)
  else
    #check left
    bsearch(arr[0...mid_idx], target)
  end

end

def merge_sort(arr)
  return arr if arr.size <= 1
  mid_idx = (arr.size) / 2
  left = arr[0...mid_idx]
  right = arr[mid_idx..-1]
  merged_left = merge_sort(left)
  merged_right = merge_sort(right)
  merge(merged_left,merged_right)
end

def merge(left,right)

  merged = []
  return right if left.empty?
  return left if right.empty?

  merged << (left[0] > right[0] ? right.shift : left.shift)
  merged + merge(left,right)

end

def greedy_make_change(amount, coins = [25,10,5,1])
  return [] if amount == 0
  largest_coin = coins.select { |coin| coin <= amount }.sort.last
  largest_coin.class
  amount_difference = amount - largest_coin
  [largest_coin] + greedy_make_change(amount_difference)
end

def make_better_change(amount, coins = [10,7,1])
  return [] if amount == 0

  coins.each do |coin|
    best << [coin] + make_better_change(amount - coin, coin)
  end

  amount_difference = amount - coin[0]
  best =  make_better_change(amount_difference, coin)
end



def greedy_make_change(amount,coins)
  return [] if amount == 0
  largest_coin = coins.select { |coin| coin <= amount }.sort.last
  amount_difference = amount - largest_coin
  [largest_coin] + greedy_make_change(amount_difference,coins)
end


def make_better_change(amount,coins)
  best = []

  #best << greedy_make_change(amount,coins)
  coins.each_with_index do |coin,idx|
    best << greedy_make_change(amount, coins[idx..-1])
  end
  best.sort_by{|array| array.length}.first
end


p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil

# p bsearch([2,6,8,13,18,21,24,55,66,77,88], 77)
# p make_better_change(14, [10,7,1])
# p merge_sort([3,2,1,1])
# p merge_sort([1,7,36,7,7,5])
# p bsearch([1,3,5,7,8,12,44,67,77,566],7)

# p subsets([1,2,3])
# p fib(5)
# a = [1,2,3,[2,3]]
# b = a.deep_dup
# b[-1] << 9
# p a
# p b

#p [1,2,[2,3],3].deep_dup


# p range(2, 5)

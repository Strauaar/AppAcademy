
#n**2 time
def bad_two_sum?(arr, target_sum)
  result = []
  arr.each_with_index do |el1, i|
    arr.each_with_index do |el2, j|
      if el1 + el2 == target_sum
        return true unless i == j
      end
    end
  end
  false
end

def okay_two_sum?(arr, target_sum)
  arr.each_with_index do |num, i|
    without_num = arr.dup
    without_num.delete_at(i)
    pair_value = without_num.bsearch { |x| x == target_sum - num }
    if !pair_value.nil?
      return true
    end
  end
  false
end

arr = [0, 1, 5, 7, 6]
 p okay_two_sum?(arr, 6) # => should be true
 p okay_two_sum?(arr, 10) # => should be false

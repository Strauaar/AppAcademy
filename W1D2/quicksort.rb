#extra_practice

def quicksort(array)
  return array if array.length == 1 || array.length == 0
  pivot_el = array[0]
  left_side = []
  array.each do |el|
    left_side << el if el < pivot_el
  end
  right_side = []
  array.each do |el|
    right_side << el if el > pivot_el
  end

  quicksort(left_side) + [pivot_el] + quicksort(right_side)
end

p quicksort([7,1,8,3,5,9,11,2,4])

def my_min(arr)
  arr.each do |el1|
    return el1 if arr.all? {|el2| el1 < el2}
  end
end

def my_min_better(arr)
  min = arr.first
  arr.each { |el| min = el if el <= min }
  min
end

def sub_sum(arr)
  max_sum = [arr.first].inject(:+)
  sub_arrays = []
  for i in 0...arr.length
    for j in i...arr.length
      sub_arrays << arr[i..j]
    end
  end
  sub_arrays.map{ |sub_arr| sub_arr.inject(:+) }.sort.last
end

def sub_sum_2(arr)
  max_i = 0
  max = arr.first
  min_i = 0
    arr[1..-1].each_with_index do |el, i|
      if (max + el) > max
        max += el
        max_i = i
      else
        max_i = i
        min_i = i
      end
    end
    p max
    arr[min_i...max_i]
  end

def sub_sum_alternate(arr)
  current = arr.first
  max = arr.first
  min_idx = -1
  max_idx = 0

  arr.each_with_index do |el, idx|
    next if idx = 0

    if current + el > 0
      max = current + el
      current += el
      max_idx = idx
    else
      min_idx = idx
      current += el
      max = el
    end
  end

  p arr[min_idx + 1..max_idx]
end


list = [2, 3, -6, 7, -6, 7]
p sub_sum_alternate(list)

p sub_sum_alternate([-5, -1, -3])

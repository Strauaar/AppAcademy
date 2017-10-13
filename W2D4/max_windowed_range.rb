def windowed_max_range(arr, range)
  current_max_range = -1.0 / 0.0
  range_start = nil
  i = 0
  until i + range > arr.size
    current_window = arr[i, range]
    current_range = current_window.last - current_window.first

    if current_range > current_max_range
      range_start = i
      current_max_range = current_range
    end
    p "RS: #{range_start}"
    i += 1
  end

  arr[range_start, range]
end

p windowed_max_range([1, 2, 3, 5, 10, 5, 2, 20], 3)

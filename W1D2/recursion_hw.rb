def sum_to(n)
  return 1 if n == 1
  n + sum_to(n-1)
end

def add_numbers(array)
  if array.count == 1
    array[0]
  else
    array.pop + add_numbers(array)
  end
end

def gamma_fnc(n)
  return 1 if n == 1
  (n-1) * gamma_fnc(n-1)
end

def ice_cream_shop(flavors, favorite)
  return false if flavors.count == 0
  return true if flavors[0] == favorite
  ice_cream_shop(flavors.pop(flavors.length - 1), favorite)
end

def reverse(string)
  return string if string.length  <= 1
  string[-1] + reverse(string[0..-2])
end

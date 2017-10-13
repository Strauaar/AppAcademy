
def factors(num)
  result = []
  idx = 1
  while idx <= num
    result << idx if num % idx == 0
    idx += 1
  end
  result
end

class Array
  def bubble_sort!(&prc)
    prc ||= Proc.new { |x,y| x <=> y }
    sorted = false
    while !sorted
      sorted = true
      self.each_with_index do |el, i|
        if prc.call(el, self[i+1]) == 1
          sorted = false
          self[i], self[i+1] = self[i+1], self[i]
        end
      end
    end
    self
  end

  def bubble_sort(&prc)
    self.dup.bubble_sort!(&prc)
  end



end

p [1,3,2,5,4,7].bubble_sort!
p [1,3,2,5,4,7].bubble_sort



def substrings(string)
  result = []
  for i in 0...string.length
    for j in i...string.length
      result << string[i..j]
    end
  end

  result
end



def subwords(string,dictionary)
  substrings(string).select {|word| dictionary.include?(word)}
end

p substrings("cat")
p subwords("cat",["at","ca"])

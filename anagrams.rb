def first_anagram?(str)
 return [[]] if str.length == 0
 first_ch = str[0]
 rest_of_word_subs = first_anagram?(str[1..-1])
 total = []
 rest_of_word_subs.each do |sub|
   total << [first_ch].concat([sub[0..-1]]).join
  #  [[sub[0..-1].concat([first_ch])].join]
 end
  rest_of_word_subs + total
end

def add_permutations(word, sub_arr)
  word.chars.permutation.map(&:join) + sub_arr
end

def anagram?(array, str)
  array.include?(str)
end


result = first_anagram?("elvis")
whole_list = add_permutations("elvis",result)
anagram?(whole_list, "lives")

def anagrams_faster(word1, word2)
  word1_arr = word1.chars
  word2_arr = word2.chars

  until word1_arr.length == 0 || word2_arr.length == 0
    if word2_arr.include?(word1_arr[0])
      index = word2_arr.index(word1_arr[0])
      word2_arr.delete_at(index)
      word1_arr.delete_at(0)
    else
      word1_arr.delete_at(0)
    end
  end

  return true if (word1_arr + word2_arr).length == 0
  false
end

# p anagrams_faster("elvis", "sdfsds")
# p anagrams_faster("elvis", "lives")

def abc_anagram(str1, str2)
  arr_1 = str1.chars.sort
  arr_2 = str2.chars.sort

  arr_1 == arr_2
end

p abc_anagram("elvis", "sdfsds")
p abc_anagram("elvis", "lives")

def fourth_anagram?(str1, str2)

  hash = Hash.new(0)

  str1.chars.each do |ch|
    hash[ch] += 1
  end

  str2.chars.each do |ch|
    hash[ch] -= 1
  end

  hash.values.all? {|num| num == 0 }

end

p fourth_anagram?("elvis", "sdfsds")
p fourth_anagram?("elvis", "lives")

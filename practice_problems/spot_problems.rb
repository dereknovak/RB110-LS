numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# Brandi TA Session

word = 'what-a-b.e.a.utiful day!'

# Your Code Here

p crazy_letters # ['w', 'H', 'a', 'T', 'a', 'B', 'e', 'A', 'u', 'T', 'i', 'F', 'u', 'L', 'd', 'A', 'y']

# -----

def zip_elements(arr1, arr2)
  # Your Code Here
end

arr1 = [1, 4, 6]
arr2 = [2, 3, 5]
p zip_elements(arr1, arr2) == [1, 2, 4, 3, 6, 5]

# -----

def everyThird(array, start)
  # Your Code Here
end

my_arr = [1, 2, [], 4, 2, 'f', 'g', 'h']
p everyThird(my_arr, 1) == [2, 2, 'h']
p everyThird(my_arr, 2) == [[], 'f']

# -----

def count_vowels(word)
  # Your Code Here
end

sample_word = 'programming'
p count_vowels(sample_word) == 3

# -----

def parts(string)
  # Your Code Here
end

word = 'Sesquipedalianism'
p parts(word) # => ['S', 'Se', 'Seq', 'Sequ'...]

# -----

# Brandi Parting Gifts

# Find the longest substring in alphabetical order.
# Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".
# The input will only consist of lowercase characters and will be at least one letter long.
# If there are multiple solutions, return the one that appears first.

p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') ==  'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'

######

# Re-order the characters of a string, so that they are concatenated into a new string in "case-insensitively-alphabetical-order-of-appearance" order.
# Whitespace and punctuation shall simply be removed!
# The input is restricted to contain no numerals and only words containing the english alphabet letters.

p alphabetized("The Holy Bible") == "BbeehHilloTy"
p alphabetized("!@$%^&*()_+=-`,") == ""
p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"

#####

# Find the longest substring in alphabetical order.
# Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".
# The input will only consist of lowercase characters and will be at least one letter long.
# If there are multiple solutions, return the one that appears first.

p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') ==  'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'

#####

# Re-order the characters of a string, so that they are concatenated into a new string in "case-insensitively-alphabetical-order-of-appearance" order.
# Whitespace and punctuation shall simply be removed!
# The input is restricted to contain no numerals and only words containing the english alphabet letters.

p alphabetized("The Holy Bible") == "BbeehHilloTy"
p alphabetized("!@$%^&*()_+=-`,") == ""
p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"

#####

def reverse_words(sentence)
  # Your implementation here
end

sample_sentence = 'Hello World'
p reverse_words(sample_sentence) # => 'olleH dlroW'

#####

def wordsOfLengthN(words, length)
  # Your implementation here
end

my_words = ['foo', 'bar', 'baz']
p wordsOfLengthN(my_words, 3) # => ['foo', 'bar', 'baz']
p wordsOfLengthN(my_words, 2) # => []

# Additional Concepts to Practice
# ***count block
# ***practice nested looping

# SPOT Session with JD

# 1. multiply string chars
# Given a string, multiply each letter by the most recent preceding number in 
# the string. Return a new string containing only the letters, multiplied by 
# their preceding number.

p mult_string('3abc') == 'aaabbbccc'
p mult_string('123abc') == 'aaabbbccc'
p mult_string('2g4ab13t0gh') == 'ggaaaabbbbttt'
p mult_string('1a5b20hi3cw') == 'abbbbbcccwww'

# -----

# Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2.
# In the alphabet, a and b are also in positions 1 and 2. Notice also that d and e in abode occupy
# the positions they would occupy in the alphabet, which are positions 4 and 5.

# Given an array of words, return an array of the number of letters that occupy their positions in the alphabet for each word.
# Input will consist of alphabet characters, both uppercase and lowercase. No spaces.

p solve(["abode","ABc","xyzD"]) == [4,3,1]
p solve(["abide","ABc","xyz"]) == [4,3,0]
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"])== [6,5,7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]

- Introductions
- Overview of Assessment format:
  => Written Assessment
    - 1hr 45min time limit 
    - Around 11 questions
    - Use Markdown
    - Clear, detailed, and precise answers
    - Time management
  => Interview Assessment
    - 1 hour / 2 problems
    - Focus: structured problem solving, Ruby fluency, and communication ability
    - No documentation
    - Be sure to complete PEDA before moving on to C
    - Test code early and often
    - Communicate! (and not just what you are typing)
- Study Tips for Assessments:
  => Practice problems
  => Study with other students
    - Try Gather.town (via #the-spot on Slack)
- Questions?
- Practice
- Wrap up & feedback form

More expectation on fluency than 109
  transformation? selection? Which is best for the job?
Try solving the same problem with different approaches (regex? range objects?)
Written easy 4-9
Interview med 1 and 2

=begin
 You are given a secret message you need to decipher. Here are the things you need to know to decipher it:
# For each word:
# the second and the last letter is switched (e.g. Hello becomes Holle)
# the first letter is replaced by its character code (e.g. H becomes 72)
# Note: there are no special characters used, only letters and spaces

Given a string array words, return an array of all characters that show up in all strings within the words (including duplicates).

p common_chars(["bella","label","roller"]) == ["e", "l", "l"]
p common_chars(["cool","lock","cook"]) == ["c", "o"]
p common_chars(["hello","goodbye","booya", "random"]) == ["o"]
p common_chars(["aabbaaaa","ccdddddd","eeffee", "ggrrrrr", "yyyzzz"]) == []
=end

___________________

Organize these

# str = 'derek'

# substrings = []
# max_range = str.length

# str.length.times do |idx|
#   1.upto(max_range) do |range|
#     substrings << str[idx, range]
#   end

#   max_range -= 1
# end

# p substrings

# score = ('a'..'z').to_a.zip((1..26).to_a).to_h
# score.each { |k, v| score[k] = v**2 }
# p score

# Study Guide Topics:
# String and Array operations: indexing, range indexing (slicing), negative indexes, assigning elements
# Hash operations: indexing, string and symbol keys
# String methods: chars, concat, count, downcase, downcase!, freeze, include?, replace, reverse, reverse!, size, slice, slice!, split, strip, strip!, upcase, upcase!
# Array methods: all?, any?, each, each_with_index, each_with_object, fetch, first, include?, join, last, map, map!, partition, pop, push, reverse, reverse!, select, select!, shift, slice, slice!, sort, sort!, unshift
# Hash methods: all?, any?, each_key, each_value, empty?, include?, key, key?, keys, map, select, select!, value?, values
# Integer methods: times
# iteration, break and next
# selection and transformation
# nested data structures and nested iteration
# shallow copy and deep copy
# method chaining

# p ({ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
#   array << pair.last
# end)

# def common_prefix(words)
#   prefix = ''
#   words[0].each_char.with_index do |char, idx|
#     if words.all? { |word| word[idx] == char }
#       prefix << char
#     else
#       return prefix
#     end
#   end
# end

# def longest_increasing_subsequence(nums)
#   ascending_nums = []
  
#   nums.size.times do |starting_idx|
#     ascending_nums << nums[starting_idx..-1]
#   end

#   ascending_nums.map! do |subarr|
#     ordered_nums = []
#     subarr.each_with_index do |num, idx|
#       if idx == 0
#         ordered_nums << num
#       elsif num < ordered_nums.last
#         next
#       else
#         ordered_nums << num
#       end
#     p ordered_nums
#     gets

#     end
#     ordered_nums
#   end

#   ascending_nums.max_by(&:size)
# end

# input_sequence = [10, 22, 9, 33, 21, 50, 41, 60, 80]
# input_sequence2 = [51, 52, 53, 10, 22, 9, 33, 21, 50, 41, 60, 80]
# input_sequence3 = [10, 22, 51, 52, 53, 54, 55, 56, 9, 33, 21, 50, 41, 60, 80]

# longest_increasing_subsequence(input_sequence) == [10, 22, 33, 50, 60, 80]
# longest_increasing_subsequence(input_sequence2) == [10, 22, 33, 50, 60, 80]
# longest_increasing_subsequence(input_sequence3) == [51, 52, 53, 54, 55, 56, 60, 80]
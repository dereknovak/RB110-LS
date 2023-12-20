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
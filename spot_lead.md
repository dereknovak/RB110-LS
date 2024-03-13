RB119 SPOT Session Material

# Introductions

```ruby
=begin

RB119 SPOT Session

Introductions
- What is your name?
- Where are you in the course?
- What would you like to cover today?

DISCLAIMER
- I am not a TA, so I can only speak from my own experience preparing/taking the exams
- I cannot disclose specific assessment questions


=end
```

# Coding Problems

## Easy

### Kebabize

```ruby
# Write a kebabize method that converts a camelCase string into a kebab case.

kebabize('camelsHaveThreeHumps') == "camels-have-three-humps"
kebabize('camelsHave3Humps') == "camels-have-humps"
```

Solution

```ruby
def kebabize(str)
 kebab = ''

 str.each_char do |char|
   case char
   when /[a-z]/ then kebab << char
   when /[A-Z]/ then kebab << '-' + char.downcase
   end
 end

 kebab
end
```

### Alphabetized

```ruby
# Re-order the characters of a string, so that they are concatenated into a new string in "case-insensitively-alphabetical-order-of-appearance" order.
# The input is restricted to contain no numerals and only words containing the english alphabet letters.

p alphabetized("The Holy Bible") == "BbeehHilloTy"
p alphabetized("!@$%^&*()_+=-`,") == ""
p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"
```

Solution

```ruby
def alphabetized(str)
  str.chars.select { |char| char =~ /[a-z]/i }.sort_by(&:downcase).join
end
```

### Drop Evens

```ruby

# Write a method that takes an array of integers and returns a new array with all of the first even integers dropped off. If all of the integers are even, then an empty array should be returned.

p drop_evens([2, 4, 5, 7]) == [5, 7]
p drop_evens([1, 3, 5, 7]) == [1, 3, 5, 7]
p drop_evens([2, 4, 5, 6]) == [5, 6]
p drop_evens([2, 4, 6, 8]) == []
```

Solution

```ruby
def drop_evens(nums)
  nums.each_with_index { |num, idx| return nums[idx..-1] if num.odd? }
  []
end
```

### Spell it out

```ruby
# Given a string, write a method that will return an array of substrings that progressively add a letter from the string. Only letters should be included in the substrings

substrings('launch') == %w(l la lau laun launc launch)
substrings('school') == %w(s sc sch scho schoo school)
substrings('p@ssw0rd') == %w(p ps pss pssw psswr psswrd)
substrings('@9%2&') == []
```

Solution

```ruby
def substrings(str)
  letters = str.chars.select { |char| char =~ /[a-z]/i }.join

  substrings = []
  1.upto(letters.size) { |range| substrings << letters[0, range] }
  substrings 
end

p substrings('launch') == %w(l la lau laun launc launch)
p substrings('school') == %w(s sc sch scho schoo school)
p substrings('p@ssw0rd') == %w(p ps pss pssw psswr psswrd)
p substrings('@9%2&') == []
```

## Medium

### Vowel Chain

```ruby
# Given a lowercase string that has alphabetic characters only and no spaces,return the length of the longest vowel substring. Vowels are any of aeiou.

p longest_vowel_chain("codewarriors") == 2
p longest_vowel_chain("suoidea") == 3
p longest_vowel_chain("iuuvgheaae") == 4
p longest_vowel_chain("ultrarevolutionariees") == 3
p longest_vowel_chain("strengthlessnesses") == 1
p longest_vowel_chain("cuboideonavicuare") == 2
p longest_vowel_chain("chrononhotonthuooaos") == 5
p longest_vowel_chain("iiihoovaeaaaoougjyaw") == 8 
```

Solution

```ruby
def longest_vowel_chain(str)
 vowels = 'aeiou'
 count = 0
 largest_chain = 0

 str.each_char do |char|
   count = (vowels.include?(char) ? (count + 1) : 0)
   largest_chain = count if count > largest_chain
 end

 largest_chain
end
```

### Beautiful Day

```ruby
word = 'what-a-b.e.a.utiful day!'

# Your Code Here

p crazy_letters(word) == ['w', 'H', 'a', 'T', 'a', 'B', 'e', 'A', 'u', 'T', 'i', 'F', 'u', 'L', 'd', 'A', 'y']
```

Solution

```ruby
def crazy_letters(word)
  letters = word.chars.select { |char| char =~ /[a-z]/i }
  letters.map.with_index { |let, idx| idx.odd? ? let.upcase : let }
end
```

### Greatest Product

```ruby
# Create a method that takes a string argument that consists entirely of numeric digits and computes the greatest product of four consecutive digits in the string. The argument will always have more than 4 digits.

p greatest_product("23456") == 360
p greatest_product("3145926") == 540
p greatest_product("1828172") == 128
p greatest_product("123987654") == 3024
```

```ruby
def greatest_product(str)
  nums = str.to_i.digits.reverse
  
  products = []
  nums.each_cons(4) { |set| products << set.reduce(:*) }
  products.max
end
```

### Non-Unique Characters

```ruby
# Create a method that returns the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. You may assume that the input string contains only alphanumeric characters.

p distinct_multiples("xyz") == 0
p distinct_multiples("xxyypzzr") == 3
p distinct_multiples("xXyYpzZr") == 3
p distinct_multiples("unununium") == 2
p distinct_multiples("multiplicity") == 3
p distinct_multiples("7657") == 1
p distinct_multiples("3141592653589793") == 4
p distinct_multiples("2718281828459045") == 5
```

Solution

```ruby
def distinct_multiples(str)
  counts = str.downcase.chars.tally
  counts.count { |k, v| v > 1 }
end
```

## Hard

### Multiply character

```ruby
# Given a string, multiply each letter by the most recent preceding number in the string. Return a new string containing only the letters, multiplied by their preceding number.

p mult_string('3abc') == 'aaabbbccc'
p mult_string('123abc') == 'aaabbbccc'
p mult_string('2g4ab13t0gh') == 'ggaaaabbbbttt'
p mult_string('1a5b20hi3cw') == 'abbbbbcccwww'
```

Solution

```ruby
def mult_string(str)
  result = ''
  multiplier = 0
  
  str.each_char do |char|
    if char =~ /[a-z]/i
      result << (char * multiplier)
    else
      multiplier = char.to_i
    end
  end

  result
end
```

### Common Prefix

```ruby
# Given an array of strings, find the common prefix between them. If none are present, `nil` should be returned.

common_prefix(['prefix', 'presume', 'pretense']) == 'pre'
common_prefix(['flower', 'floatation', 'flute']) == 'fl'
common_prefix(['shower', 'chower', 'thower']) == nil
common_prefix(['ruby', 'javascript', 'python']) == nil
```

Solution
```ruby
def common_prefix(arr)
  test_str = arr[0]
  prefix = ''

  test_str.each_char.with_index do |char, idx|
    if arr.all? { |str| char == str[idx] }
      prefix << char
    else
      return (prefix.empty? ? nil : prefix)
    end
  end
end
```

### Equal Sum Index

```ruby
# Create a method that takes an array of integers as an argument. Determine and return the index N for which all numbers with an index less than N sum to the same value as the numbers with an index greater than N. If there is no index that would make this happen, return -1.

# If you are given an array with multiple answers, return the index with the smallest value.

# The sum of the numbers to the left of index 0 is 0. Likewise, the sum of the numbers to the right of the last element is 0.

p equal_sum_index([1, 2, 4, 4, 2, 3, 2]) == 3
p equal_sum_index([7, 99, 51, -48, 0, 4]) == 1
p equal_sum_index([20, 5, -60, 10, 25]) == 0
p equal_sum_index([20, 10, -60, 5, 25]) == 0
p equal_sum_index([20, 10, -60, 5, 20]) == -1
```

Solution

```ruby
def equal_sum_index(nums)
  return 0 if nums.sum == 0

  nums.size.times do |idx|
    return idx if nums[0...idx].sum == nums[(idx + 1)..-1].sum
  end

  -1
end
```

## Advanced

### Increasing Integers

```ruby
# Write a method that determines the longest sequence of increasing integers from a given array.

input_sequence = [10, 22, 9, 33, 21, 50, 41, 60, 80]
input_sequence2 = [51, 52, 53, 10, 22, 9, 33, 21, 50, 41, 60, 80]
input_sequence3 = [10, 22, 51, 52, 53, 54, 55, 56, 9, 33, 21, 50, 41, 60, 80]

longest_increasing_subsequence(input_sequence) == [10, 22, 33, 50, 60, 80]
longest_increasing_subsequence(input_sequence2) == [10, 22, 33, 50, 60, 80]
longest_increasing_subsequence(input_sequence3) == [10, 22, 51, 52, 53, 54, 55, 56, 60, 80]
```

Solution

```ruby
def find_subarrays(arr)
  subarrays = []

  arr.size.times do |idx1|
    idx1.upto(arr.size - 1) do |idx2|
      subarrays << arr[idx1..idx2]
    end
  end

  subarrays
end

def convert_to_increasing(arr)
  increasing_arr = [arr[0]]

  1.upto(arr.size - 1) do |idx|
    increasing_arr << arr[idx] if arr[idx] > increasing_arr.last
  end

  increasing_arr
end

def longest_increasing_subsequence(arr)
  subarrays = find_subarrays(arr)
  subarrays.map! { |subarr| convert_to_increasing(subarr) }
  subarrays.max_by(&:size)
end
```

# Iteration

```ruby
[1, 2, 3].select do |num|
  num > 5
  'hi'
end
```

```ruby
result = [1, 2, 3].map do |num|
           num.odd?
         end

result
```

# Nested Iteration

```ruby
[['apple'], ['orange', 'plum'], ['banana', 'strawberry']].partition do |subarr|
  subarr.any? do |str|
    str.length < 6
  end
end
```

```ruby
nums = [[2, 4, 6], [1, 2, 7], [1, 3, 5]]

result = nums.partition do |set|
           set.any? do |num|
             num.odd?
           end
         end

result
```

```ruby
hashes = [{greetings: %w(hello hi howdy), farewells: %w(goodbye bye cya)}, {names: %w(chris pete derek), roles: %w(ceo teacher student)}]

hashes.map! do |hash|
 hash.select do |k, v|
   v[1].include?('e')
 end
end

hashes
```

```ruby
[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.to_i == el
      el + 1
    else
      el.map do |n|
        n + 1
      end
    end
  end
end
```

# Confusing Topics

## Method Chaining

```ruby
str = 'hello'
str.capitalize.reverse
```

## Collection Reference

```ruby
array = ['&#@Found&#@', [[[], ['all']]], {'the' => 1}, {a: ['strings']}]

string1 =
string2 =
string3 =
string4 =

puts "#{string1} #{string2} #{string3} #{string4}"
```

## Destructive iterative methods

```ruby
# Without adding any additional code, change both instances of `method` to the appropriate method call so that the last line returns the correct value.

letters = %w(a t s e v i r o b w u)
vowels = 'aeiou'

letters.method { |char| vowels.include?(char) }

p letters == vowels.method  # => true
```

## Nested Reassignment
```ruby
a = [1, 3]
b = 2
arr = [a, b]
arr

a[1] = 5
arr

arr[1] = 5
b
```

## Mutating during iteration

```ruby
numbers = [1, 2, 3, 4, 5]

result = numbers.each do |num|
           puts num
           numbers.shift
         end

result
```

## Shallow Copy

```ruby
arr1 = ['a', 'b', 'c']
arr2 = arr1.dup

arr2.map!(&:upcase)
arr1
```
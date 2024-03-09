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

### Drop Evens

```ruby
=begin

Write a method that takes an array of integers and returns a new array 
with all of the first even integers dropped off. If all of the integers are even, then an empty array should be returned.

=end

p drop_evens([2, 4, 5, 7]) == [5, 7]
p drop_evens([1, 3, 5, 7]) == [1, 3, 5, 7]
p drop_evens([2, 4, 5, 6]) == [5, 6]
p drop_evens([2, 4, 6, 8]) == []
```

## Medium

### Vowel Chain

```ruby
=begin

Given a lowercase string that has alphabetic characters only and no spaces,
return the length of the longest vowel substring. Vowels are any of aeiou.

=end
p longest_vowel_chain("codewarriors") == 2
p longest_vowel_chain("suoidea") == 3
p longest_vowel_chain("iuuvgheaae") == 4
p longest_vowel_chain("ultrarevolutionariees") == 3
p longest_vowel_chain("strengthlessnesses") == 1
p longest_vowel_chain("cuboideonavicuare") == 2
p longest_vowel_chain("chrononhotonthuooaos") == 5
p longest_vowel_chain("iiihoovaeaaaoougjyaw") == 8 
```

### Beautiful Day

```ruby
word = 'what-a-b.e.a.utiful day!'

# Your Code Here

p crazy_letters(word) == ['w', 'H', 'a', 'T', 'a', 'B', 'e', 'A', 'u', 'T', 'i', 'F', 'u', 'L', 'd', 'A', 'y']
```

### Alphabetized

```ruby
# Re-order the characters of a string, so that they are concatenated into a new string in "case-insensitively-alphabetical-order-of-appearance" order.
# The input is restricted to contain no numerals and only words containing the english alphabet letters.

p alphabetized("The Holy Bible") == "BbeehHilloTy"
p alphabetized("!@$%^&*()_+=-`,") == ""
p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"
```


## Hard

### Multiply character

```ruby
# 1. multiply string chars
# Given a string, multiply each letter by the most recent preceding number in 
# the string. Return a new string containing only the letters, multiplied by 
# their preceding number.

p mult_string('3abc') == 'aaabbbccc'
p mult_string('123abc') == 'aaabbbccc'
p mult_string('2g4ab13t0gh') == 'ggaaaabbbbttt'
p mult_string('1a5b20hi3cw') == 'abbbbbcccwww'
```

### Common Prefix

```ruby
# Given an array of strings, find the common prefix between them. If none are
# present, `nil` should be returned.

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

## Advanced

### Increasing Integers

```ruby
# Write a method that determines the longest sequence of increasing integers
# from a given array.

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

## 

# Iteration

```ruby
[1, 2, 3].select do |num|
  num > 5
  'hi'
end
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
[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.to_i == el   # it's an integer
      el + 1
    else                    # it's an array
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

numbers.each do |num|
  puts num
  numbers.shift
end
```

## Shallow Copy

```ruby
arr1 = ['a', 'b', 'c']
arr2 = arr1.dup

arr2.map!(&:upcase)
arr1

```
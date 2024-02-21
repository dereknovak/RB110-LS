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
- I cannot disclose specific assessments questions


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
### Mexican Wave

```ruby
=begin

Create a method that turns a string into a Mexican Wave. You will be passed a string and you must return that string
in an array where an uppercase letter is a person standing up.

=end
p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave("") == []
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave(" gap ") == [" Gap ", " gAp ", " gaP "] 
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
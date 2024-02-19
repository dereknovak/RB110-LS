## 1

```ruby
numbers = [1, 2, 3]
counter = 0

loop do
  break if counter == numbers.size
  puts numbers[counter]
  counter += 1
end
```

## 2

```ruby
[1, 2, 3].each do |num|
  puts num
end
```

## 3

```ruby
hash = { a: 1, b: 2, c: 3 }

hash.each do |key, value|
  puts "The key is #{key} and the value is #{value}"
end
```

## 4

```ruby
def a_method
  [1, 2, 3].each do |num|
    puts num * 2
  end
end
```

## 5

```ruby
def a_method
  [1, 2, 3].each do |num|
    puts num * 2
  end

  puts 'hi'
end
```

## 6

```ruby
[1, 2, 3].select do |num|
  num.odd?
end
```

## 7

```ruby
[1, 2, 3].select do |num|
  num + 1
end
```

## 8

```ruby
[1, 2, 3].select do |num|
  num + 1
  puts num
end
```

## 9

```ruby
[1, 2, 3].map do |num|
  num * 2
end
```

## 10

```ruby
[1, 2, 3].map do |num|
  num.odd?
end
```

## 11

```ruby
[1, 2, 3].map do |num|
  num.odd?
  puts num
end
```

## 12

```ruby
[1, 2, 3].map do |num|
  'hi'
end
```

## 13

```ruby
[1, 2, 3].any? do |num|
  num > 2
end
```

## 14

```ruby
{ a: "ant", b: "bear", c: "cat" }.any? do |key, value|
  value.size > 4
end
```

## 15

```ruby
[1, 2, 3].all? do |num|
  num > 2
end
```

## 16


```ruby
{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|
  value.length >= 3
end
```

## 17

```ruby
[1, 2, 3].each_with_index do |num, index|
  puts "The index of #{num} is #{index}."
end
```

## 18

```ruby
[1, 2, 3].each_with_object([]) do |num, array|
  array << num if num.odd?
end
```

## 19

```ruby
[1, 2, 3].first
```

## 20

```ruby
{ a: "ant", b: "bear", c: "cat" }.first(2)
```

## 21

```ruby
[1, 2, 3].include?(1)
```

## 22

```ruby
[1, 2, 3].partition do |num|
  num.odd?
end
```

## Practice Problem 1

What is the return value of the select method below? Why?
```ruby
[1, 2, 3].select do |num|
  num > 5
  'hi'
end
```

## Practice Problem 2

How does count treat the block's return value? How can we find out?
```ruby
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
```

## Practice Problem 3

What is the return value of reject in the following code? Why?
```ruby
[1, 2, 3].reject do |num|
  puts num
end
```

## Practice Problem 4

What is the return value of each_with_object in the following code? Why?
```ruby
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
```

## Practice Problem 5

What does `shift` do in the follow code? How can we find out?
```ruby
hash = { a: 'ant', b: 'bear' }
hash.shift
```

## Practice Problem 6

What is the return value of the following statement? Why?
```ruby
['ant', 'bear', 'caterpillar'].pop.size
```

## Practice Problem 7

What is the block's return value in the follow code? How is it determined? Also, what is the return value of `any?` in this code and what does it output?
```ruby
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
```

## Practice Problem 8

How does `take` work? Is it destructive? How can we find out?
```ruby
arr = [1, 2, 3, 4, 5]
arr.take(2)
```

## Practice Problem 9

What is the return value of `map` in the following code? Why?
```ruby
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
```

## Practice Problem 9

What is the return value of the follow code? Why?
```ruby
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
```

# Working with Blocks

## Example 1

What's happening in this, seemingly simple, piece of code?
```ruby
[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
```

## Example 2

```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
```

## Example 3

```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
```

## Example 4

```ruby
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
```

## Example 5

```ruby
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
```

## Example 6

```ruby
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
```

## Example 7

```ruby
arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]

arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end
```

## Example 8

```ruby
[[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|
  arr.select do |item|
    if item.to_s.to_i == item    # if it's an integer
      item > 13
    else
      item.size < 6
    end
  end
end
```

## Example 9

```ruby
[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end
```

## Example 10

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

# Random Problems

## 1

```ruby
[['a', 'b'], ['c', 'd'], ['e', 'f']].map do |sub_arr|
  sub_arr.map do |letter|
    letter.upcase
  end
end
```

## 2

```ruby
[[1, 2], [3, 4]].map do |subarr|
  subarr.select do |num|
    num.even?
  end
end
```

## 3

```ruby
[['apple'], ['orange', 'plum'], ['banana', 'strawberry']].partition do |subarr|
  subarr.any? do |str|
    str.length < 6
  end
end
```

## 4

```ruby
names = ['Bob', 'Joe', 'Steve', 'Janice', 'Susan', 'Helen']
x = 1

names.each do |name|
  puts "#{x}. #{name}"
  x += 1
end
```

## 5

What does the `each` method in the following program return after it is finished executing?
```ruby
x = [1, 2, 3, 4, 5]
x.each do |a|
  a + 1
end
```

## 6

```ruby
x = 42
loop do
  puts x
  x = 2
  break
end
puts x
```

## 7

```ruby
x = 0
while x < 5
  y = x * x
  x += 1
end

puts y
```
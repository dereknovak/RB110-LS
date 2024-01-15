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
On line 1, local variable `numbers` is initialized and references an array object with the elements `[1, 2, 3]`. On line 2, local variable `counter` is initialized and references the integer `0`.

On line 5, the `loop` method is invoked and gets passed a `do...end` block as an argument, creating a loop between lines 6-8. Upon each iteration of the loop, a `break if` condition is set if the value of `counter` is the same size as the `numbers` array, the current index of `numbers` will output (specified by `counter`), and `counter` will increment by `1`. Because there are 3 elements in the `numbers` array, this loop will execute 3 times, outputting each of its elements to the console.

## 2

```ruby
[1, 2, 3].each do |num|
  puts num
end
```
In this example, the `each` method is called on the array object `[1, 2, 3]` and gets passed a `do...end` block as an argument, binding each element to the block's parameter `num` throughout iteration. Upon each iteration of the block, `num`, representing the current element, is output by invocation of the `puts` method. As a result, each element of the calling array object will be output on separate lines.

## 3

```ruby
hash = { a: 1, b: 2, c: 3 }

hash.each do |key, value|
  puts "The key is #{key} and the value is #{value}"
end
```
On line 1, local variable `hash` is initialized and references the hash object `{ a: 1, b: 2, c: 3 }`. On line 3, the `each` method is called on `hash` and gets passed a `do...end` block as an argument, binding each key and value to the block's parameters `key`, and `value`, respectively, throughout iteration. Upon each iteration of the block, `key` and `value`, representing the current values from the calling hash for each, are interpolated into the string object `"The key is #{key} and the value is #{value}"`, outputting a string such as `"The key is a and the value is 1"` to the console for each key-value pair in the hash.

## 4

```ruby
def a_method
  [1, 2, 3].each do |num|
    puts num * 2
  end
end
```
On line 1, the method `a_method` is defined with no parameters. Within the method, the `each` method is called on the array object `[1, 2, 3]` and gets passed a `do...end` block as an argument, binding each element to the block's parameter `num` throughout iteration. Upon each iteration of the block, the current value of `num` is doubled, then output by invocation of the `puts` method. As a result, the integers `2`, `4`, and `6` will be output on separate lines.

## 5

```ruby
def a_method
  [1, 2, 3].each do |num|
    puts num * 2
  end

  puts 'hi'
end
```
On line 1, the method `a_method` is defined with no parameters. Within the method, the `each` method is called on the array object `[1, 2, 3]` and gets passed a `do...end` block as an argument, binding each element to the block's parameter `num` throughout iteration. Upon each iteration of the block, the current value of `num` is doubled, then output by invocation of the `puts` method, outputting `2`, `4`, and `6` to the console, followed by `hi` from the `puts` method invocation on line 6.

## 6

```ruby
[1, 2, 3].select do |num|
  num.odd?
end
```
In this example, the `select` method is called on the array object `[1, 2, 3]` and gets passed a `do...end` block as an argument, binding each element to the block's parameter `num` throughout iteration. The `select` method will return a new array, containing only the elements from the calling array that evaluate as `true` from the block's condition. Upon each iteration of the block, the `odd?` method is called on the current value of `num`, which checks whether the value is an odd integer. Because only `1` and `3`, will return `true`, the array `[1, 3]` will be returned.

## 7

```ruby
[1, 2, 3].select do |num|
  num + 1
end
```
In this example, the `select` method is called on the array object `[1, 2, 3]` and gets passed a `do...end` block as an argument, binding each element to the block's parameter `num` throughout iteration. The `select` method returns a new array object that contains only elements that evaluate as true from the block. Upon each iteration of the block, the block returns the sum of the current value of `num` and `1`. Because each of these returns will be an integer, and every integer evaluates as true in Ruby, `select` will return `[1, 2, 3]`.

## 8

```ruby
[1, 2, 3].select do |num|
  num + 1
  puts num
end
```
This problem will `1`, `2`, and `3` and return an empty array. Although line 2 returns the sum of the current value of `num` and `1`, it does not do anything with that value; therefore, when `num` is passed as argument to the `puts` method invocation on line 3, just its current value will be output. Because the `select` method returns a new array that contains only the elements that evaluate as true, and `puts` always returns `nil` (a falsy value), none of the elements will evaluate as true and therefore an empty array will be returned.

## 9

```ruby
[1, 2, 3].map do |num|
  num * 2
end
```
The `map` method is called on the array object `[1, 2, 3]` and gets passed a `do...end` block as an argument, binding each element to the block's parameter `num` throughout iteration. `map` returns a new array with transformed elements based upon the last line in its block. Each iteration of the block returns the product of the current value of `num` and `2`, which will return `[2, 4, 6]` from `map` as a result.

## 10

```ruby
[1, 2, 3].map do |num|
  num.odd?
end
```
The `map` method is called on the array object `[1, 2, 3]` and gets passed a `do...end` block as an argument, binding each element to the block's parameter `num` throughout iteration. `map` returns a new array with transformed elements based on the return value of the last line of its block. Because each iteration of the block returns a boolean object, representing if the integer is odd, `map` will return the array object `[true, false, true]` as a result.

## 11

```ruby
[1, 2, 3].map do |num|
  num.odd?
  puts num
end
```
The `map` method is called on the array object `[1, 2, 3]` and gets passed a `do...end` block as an argument, binding each element to the block's parameter `num` throughout iteration. `map` will return a new array with transformed elements based on the return value of the last line in its block. Upon each iteration of the block, a boolean is returned based on if the current value of `num` is odd; however, it does not do anything with this value. The current value is then output by invocation of the `puts` method, outputting `1`, `2`, then `3` to the console. Because `puts` always returns `nil`, and it evaluates on the last line of the block, `map` will return `[nil, nil, nil]`.

## 12

```ruby
[1, 2, 3].map do |num|
  'hi'
end
```
The `map` method is called on the array object `[1, 2, 3]` and gets passed a `do...end` block as an argument, binding each element to the block's parameter `num` throughout iteration. `map` will return a new array with transformed elements based on the return value of the last line of its block. Because each iteration of the block simply returns the string object `'hi'`, `map` will return the array object `['hi', 'hi', 'hi']`.

## 13
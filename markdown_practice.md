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

```ruby
[1, 2, 3].any? do |num|
  num > 2
end
```
The `any?` method is called on the array object `[1, 2, 3]` and gets passed a `do...end` block as an argument, binding each element to the block's parameter `num` throughout iteration. `any?` will return `true` if any of the elements evaluate as `true` based upon the return value of the last line in its block; otherwise, it will return `false`. Because each iteration of the block simply evaluates whether the current value of `num` is greater than `2`, and `3` will evaluate as `true`, `any?` returns `true`.

## 14

```ruby
{ a: "ant", b: "bear", c: "cat" }.any? do |key, value|
  value.size > 4
end
```
The `any?` method is called on the hash object `{ a: "ant", b: "bear", c: "cat" }` and gets passed a `do...end` block as an argument, binding each key-value pair to the block's parameters `key` and `value`, respectively, throughout iteration. `any?` will return `true` if any of the elements evaluate as `true` based upon the evaluation of the last line in its block; otherwise, it will return `false`. Because the block simply evaluates whether the size of the current value of `value` is larger than `4`, and no element has a size larger than 4, `any?` will return `false`.

## 15

```ruby
[1, 2, 3].all? do |num|
  num > 2
end
```
The `all?` method is called on the array object `[1, 2, 3]` and gets passed a `do...end` block as an argument, binding each element to the block's parameter `num` throughout iteration. `all?` will return `true` only if all elements evaluate as true on the last line of its block. Because `1` evaluates as false, the iteration short circuits and `all?` immediately returns `false`.

## 16


```ruby
{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|
  value.length >= 3
end
```
The `all?` method is called on the hash object `{ a: "ant", b: "bear", c: "cat" }` and gets passed a `do...end` block as an argument, binding each key-value pair to the block's parameters `key` and `value`, respectively, throughout iteration. `all?` will return `true` only if all elements evaluates as true on the last line of its block. Because every element's length is at least `3` characters long, all elements evaluate as true, resulting in `true` being returned from `all?`.

## 17

```ruby
[1, 2, 3].each_with_index do |num, index|
  puts "The index of #{num} is #{index}."
end
```
The `each_with_index` method is called on the array object `[1, 2, 3]` and gets passed a `do...end` block as an argument, binding each element to the block's parameter `num` and its index to `index` throughout iteration. Upon each iteration of the block, the current value of​`num` and `index` is interpolated into the string `"The index of #{num} is #{index}."`, outputting a string such as `The index of 1 is 0.` for each element in the calling array by invocation of the `puts` method.

## 18

```ruby
[1, 2, 3].each_with_object([]) do |num, array|
  array << num if num.odd?
end
```
The `each_with_object` method is called on the array object `[1, 2, 3]` and gets passed an empty array object and a `do...end` block as arguments, binding each element to the block's parameter `num` throughout iteration. The second parameter, `array`, acts as a placeholder variable, referencing the array object that will be returned from the method. Upon each iteration of the block, the `odd?` method checks whether the current value of `num` is an odd integer; if evaluated as true, that value will be concatenated into `array`. Because both `1` and `3` evaluate as `true`, both integers are concatenated into `array`, returning `[1, 3]` from `each_with_object`.

## 19

```ruby
[1, 2, 3].first
```
The `first` method is called on the array object `[1, 2, 3]`, returning the integer `1`.

## 20

```ruby
{ a: "ant", b: "bear", c: "cat" }.first(2)
```
The `first` method is called on the hash object `{ a: "ant", b: "bear", c: "cat" }` and gets passed `2` as an argument, returning `[[:a, "ant"], [:b, "bear"]]`, which represents the first 2 key-value pairs of the hash.

## 21

```ruby
[1, 2, 3].include?(1)
```
The `include?` method is called on the array object `[1, 2, 3]` and gets passed `1` as an argument, which checks whether the calling array includes the element `1`. Because this evaluates as true, the boolean object `true` is returned.

## 22

```ruby
[1, 2, 3].partition do |num|
  num.odd?
end
```
The `partition` method is called on the array object `[1, 2, 3]` and gets passed a `do...end` block as an argument, binding each element to the block's parameter `num` throughout iteration. `partition` separates elements into a 2 subarray nested array, split by truthy and falsy elements based upon the return value of the last line in its block. Because `1` and `3` are odd numbers and `2` is not, the array object `[[1, 3], [2]]` will be returned from `partition`.

## Practice Problem 1

What is the return value of the select method below? Why?
```ruby
[1, 2, 3].select do |num|
  num > 5
  'hi'
end
```
The `select` method will return `[1, 2, 3]​`, which is a new array containing all elements from the calling array. `select` returns a new array that contains only the elements that evaluate as true based upon the last line of its block argument. Because everything in Ruby evaluates as true except for the objects `false` and `nil`, the string object `'hi'` is considered truthy and therefore the current element will be returned.

## Practice Problem 2

How does count treat the block's return value? How can we find out?
```ruby
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
```
The `count` method, when passed a block, will count the elements that evaluate as true based upon the last line of its block. In this example, both `'ant'` and `'bat'`have a string length that is less than `4`, which evaluates as true; therefore, `count` will return the integer `2`. This can be proven by assigning the return value to a new variable, then output it by invocation of the `puts` method.

## Practice Problem 3

What is the return value of reject in the following code? Why?
```ruby
[1, 2, 3].reject do |num|
  puts num
end
```
In this example, `reject` will return `[1, 2, 3]​`, which represents a new array object containing all of the elements from the calling array. `reject` returns a new array that contains only the elements from the calling array that its block returns a falsy value. Because the `puts` method invocation always returns `nil`, each iteration of the block will return a falsy value and therefore every element will be returned.

## Practice Problem 4

What is the return value of each_with_object in the following code? Why?
```ruby
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
```
In this example, `each_with_object` will return `[ "a" => "ant, "b" => "bear", "c" => "cat"]`. The `each_with_object` is called on the array object `['ant', 'bear', 'cat']​` and gets passed `{}` and a `do...end` block as an argument, binding each element to the block's parameter `value` throughout iteration. The other parameter `hash` represents the placeholder variable that references the hash object that will be returned from the method. Upon each iteration of the block, the first letter of each value, represented by `value[0]`, is set as a key for `hash` with its value being the current value of `value`.

## Practice Problem 5

What does `shift` do in the follow code? How can we find out?
```ruby
hash = { a: 'ant', b: 'bear' }
hash.shift
```
The `shift` method, when used with a hash, removes and returns the first key-value pair as an array. In this example, `[:a, "ant"]` would be returned. I was able to find this information within the Ruby Documentation for "class Hash" and locating the `#shift` method there.

## Practice Problem 6

What is the return value of the following statement? Why?
```ruby
['ant', 'bear', 'caterpillar'].pop.size
```
The `pop` method is called on the array object `['ant', 'bear', 'caterpillar']`, returning the element `'caterpillar'`. The `size` method is then called on this string object, returning the integer `11`, representing the length of characters present in the string.

This example demonstrates the concept of *Method Chaining*. Method chaining allows a method to be called on the *return value* of a previous method call while on the same line of code. It's important to note that this does not mean that muliple methods are being called on the same object; it's simply a chain of method invocation.

## Practice Problem 7

What is the block's return value in the follow code? How is it determined? Also, what is the return value of `any?` in this code and what does it output?
```ruby
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
```
While the block is set up to iterate 3 times, due to the calling array `[1, 2, 3]` containing 3 elements, it will only complete iteration one single time. The `any?` method returns `true` if any of the elements return a truthy value from the last line of its block. Because `1` is an odd integer, the iteration short-circuits as its condition has already been met and does not need to iterate any further, and `any?` will return `true`.

This example will actually clearly demonstrate this short-circuit due to the `puts` method invocation, which outputs `1` to the console before the block returns its first, and only, value. No other elements are output as iteration has terminated.

## Practice Problem 8

How does `take` work? Is it destructive? How can we find out?
```ruby
arr = [1, 2, 3, 4, 5]
arr.take(2)
```
The `take` method is an alias of `first`, which returns the first number of elements in the calling array based upon its integer argument. In this example, the first `2` elements are returned from the method as the array `[1, 2]`. This is not a destructive operation. We can find out more information about this method through the Ruby Documentation, specifically in the "class Array" section.

## Practice Problem 9

What is the return value of `map` in the following code? Why?
```ruby
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
```
The `map` method is called on the hash object `{ a: 'ant', b: 'bear' }` and gets passed a `do...end` block as an argument, binding each key-value pair to the block's parameters `key` and `value`, respectively, throughout iteration. `map` will return an array with transformed elements, based upon the return value of the last line of its block. Upon each iteration of the block, an `if` condition is employed, which checks whether the character size of the current value of `value` is greater than 3. If evaluated as true, `value` is simply returned; otherwise, nothing happens and `nil` is returned. Because `ant` evaluates as false, `nil` will be returned for the first element; `bear` evaluates as true, so `bear` will be returned. This results in `map` returning the array `[nil, "bear"]`.

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
The `map` method is called on the array object `[1, 2, 3]` and gets passed a `do...end` block as an argument, binding each element to the block's parameter `num` throughout iteration. `map` returns a new array with the calling elements transformed based upon the return value of the last line of its block. Upon each iteration of the block, an `if` statement is employed, which first checks whether the current value of `num` is greater than `1`. If evaluated as true, `num` will be output by invocation of the `puts` method and `nil` will be returned (`puts` always returns `nil`); otherwise, `num` will just be returned.

Because both `1` is not greater than `1`, `1` will be returned on the first iteration. Both `2` and `3` evaluate as true, therefore `nil` will be returned for both. This results in `map` returning the array `[1, nil, nil]`.

# Working with Blocks

## Example 1

What's happening in this, seemingly simple, piece of code?
```ruby
[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
```
The `each` method is called on the nested array object `[[1, 2], [3, 4]]` and gets passed a `do...end` block as an argument, binding each subarray to the block's parameter `arr` throughout iteration. Upon each iteration of the block, the first element of the current subarray is output by invocation of the `puts` method. Because there are 2 subarrays, `1` and `3` will be output.

`each` returns the calling array after iteration is complete. Because no destructive methods happened within iteration, `[[1, 2], [3, 4]]` will be returned.

## Example 2

```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
```
The `map` method is called on the nested array object `[[1, 2], [3, 4]]` and gets passed a `do...end` block as an argument, binding each subarray to the block's parameter `arr` throughout iteration. `map` returns a new array with the calling elements transformed based upon the return value of the last line of its block. Each iteration of the block simply outputs the first element of the current subarray and returns `nil` (`puts` always returns `nil`). Because there are 2 subarrays, `1` and `3` will output and `map` will return `[nil, nil]`.

## Example 3

```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
```
The `map` method is called on the nested array object `[[1, 2], [3, 4]]` and gets passed a `do...end` block as an argument, binding each subarray to the block's parameter `arr` throughout iteration. `map` returns a new array with the calling elements transformed based upon the return value of the last line of its block. Upon each iteration of the block, the first element of the current subarray is output by invocation of the `puts` method, then the block returns that same element. This will output `1` and `3`, then return the array object `[1, 3]`. This differs from the previous example because `arr.first` exists on the last line of the block, while the `puts` method is on the penultimate line and therefore does not affect the return value of the block.

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
The `each` method is called on the nested array object `[[18, 7], [3, 12]]` and gets passed a `do...end` block as an argument, binding each subarray to the block's parameter `arr` throughout iteration. Upon each iteration of the block, the `each` method is called again on the current subarray and gets passed another `do...end` as an argument, binding each element of the subarray to the block's parameter `num` throughout iteration. Upon each iteration of the inner-block, an `if` condition is employed, which will output the current value of `num` if its value is greater that `5`. Because `18`, `7`, and `12` will evaluate as `true`, these integers will be output in sequence.

The `each` method returns its calling array after iteration is complete. Because no destructive methods were called on elements of the calling nested array, `[[18, 7], [3, 12]]` will be returned from `each` and assigned to the initialized local variable `my_arr`.

## Example 5

```ruby
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
```
The `map` method is called on the nested array object `[1, 2], [3, 4]]` and gets passed a `do...end` block as an argument, binding each subarray to the block's parameter `arr` throughout iteration. `map` returns a new array with the calling elements transformed based upon the return value of the last line of its block. Upon each iteration of the block, the `map` method is called again on the current subarray and gets passed another `do...end` block as an argument, binding each element of the subarray to the block's parameter `num` throughout iteration. Upon each iteration of the inner-block, the product of the current value of `num` and `2` is returned, which returns `[2, 4]` for the first subarray and `[6, 8]` for the second. Because this is the last line of the outer-block, the original `map` will return `[[2, 4], [6, 8]]`.

## Example 6

```ruby
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
```
The `select` method is called on the array object `[{ a: 'ant', b: 'elephant' }, { c: 'cat' }]` and gets passed a `do...end` block as an argument, binding each hash object to the block's parameter `hash` throughout iteration. `select` returns a new array the contains only the elements that evaluate as true on the last line of its block. Upon each iteration of the block, the `all?` method is called on the current hash and gets passed another `do...end` block as an argument, binding each key-value pair to the block's parameters `key` and `value`, respectively, throughout iteration. `all?` will only return `true` if all of its elements evaluate as true on the last line of its block. Each iteration of the block checks whether the first character of the current value of `value` is equal to its current key, converted to a string.

For the first hash, `:a` evaluates as true but `:b` does not; therefore, the first iteration of `all?` returns `false`. For the second hash, `:c` evaluates as true, which is the only key-value pair; therefore, the second `all?` returns true. Because of these return values from `all?`, `select` will return `[{:c => 'cat'}]`.

## Example 7

```ruby
arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]

arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end
```
On line 1, local variable `arr` is initialized and references the nested array object `[['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]`. On line 3, the `sort_by` method is called on `arr` and gets passed a `do...end` block as an argument, binding each subarray to the block's parameter `sub_arr` throughout iteration. `sort_by` returns a new array, sorting each element based upon the the return value of the last line of its block. Upon each iteration of the block, the `map` method is called on the current subarray and gets passed another `do...end` block as an argument, binding each element to the block's parameter `num` throughout iteration. The `map` method iterates through a collection, returning a new array that contains transformed elements from the calling collection based upon the return value of the last line in its block. Each iteration of the inner-block converts the current element to an integer, resulting in `map` returning the same subarray but with integer objects rather than string ones.

Because each element has been converted into an integer, sorting the elements will follow integer rules rather than string rules. As a result, `[["1", "8", "9"], ["1", "8", "11"], ["2", "6", "13"], ["2", "12", "15"]]` will be returned. It's important to note that, despite the elements being convert into an integer, the return values are strings. This is because `map` transformed them into integers so that `sort_by` understood *how* to sort the elements.

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
The `map` method is called on the nested array object `[[8, 13, 27], ['apple', 'banana', 'cantaloupe']]` and gets passed a `do...end` block as an argument, binding each subarray to the block's parameter `arr` throughout iteration. The `map` method iterates through a collection, returning a new array that contains transformed elements from the calling collection based upon the return value of the last line in its block. Upon each iteration of the block, the `select` method is called on the current subarray, binding each element to the block's parameter `item` throughout iteration. The `select` method iterates through a collection, returning a new collection that contains only the elements from the calling collection that evaluate as true based upon the return value of the last line of its block. Upon each iteration of the inner-block, an `if` statement is employed, which checks whether the current value of `item` is an integer. If evaluated as true, a boolean is returned based on if `item` is greater than `13`; otherwise, a boolean is returned based on if the character size of `item` is less than `6`.

The first subarray will follow the `if` branch, as all elements are integers, returning `[27]` from `select`. The second subarray will follow the `else` branch, as all elements are strings, returning `['apple']`. These 2 transformed subarrays are then returned from `map`, resulting in the return value `[[27], ['apple']]`.
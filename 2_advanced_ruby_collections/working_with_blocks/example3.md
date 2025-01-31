```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
```
On line 1, the `map` method is called on the nested array object `[[1, 2], [3, 4]]` and gets passed a `do...end` block as an argument, binding each sub-array to the block parameter `arr` throughout iteration. Upon each iteration of the block, the `first` method gets called on `arr`, returning the integers `1` and `3`, respectively, and outputting them to the console by invocation of the `puts` method. These values are then returned again on the next line, which then, being the last line of the block, returns each value as an array element (`[1, 3]`).
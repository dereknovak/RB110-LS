```ruby
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
```
On line 1, the `each` method is called on the nested array object `[[18, 7], [3, 12]]` and gets passed a `do...end` block as an argument, binding each sub-array to the block parameter `arr` throughout iteration. Upon each iteration of the block, `each` is called again on `arr` and gets passed another `do...end` block, binding each element of the sub-array to the block's parameter `num`. Upon each iteration of the inner block, an `if` condition is employed, which checks whether the current element is greater than `5`. If evaluated as true, the value is output by invocation of the `puts` method. After all iterations have been executed, the integers `18`, `7`, and `12` get output, and the outer `each` method's return value gets assigned to the initialized local variable `my_arr`. Because `each` returns the calling object, `[[18, 7], [3, 12]]` is assigned to `my_arr`.
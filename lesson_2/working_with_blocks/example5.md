```ruby
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
```
On line 1, the `map` method is called on the nested array object `[[1, 2], [3, 4]]` and gets passed a `do...end` block, binding each sub-array to the block parameter `arr` throughout iteration. Upon each iteration of the block, `map` is again called on the current sub-array bound to `arr` and gets passed a `do...end` block, binding each element of the sub-array to the block's parameter `num`. Each iteration of the block returns double the current element, which returns `[2, 4]` and `[6, 8]`. Because the inner `map` invocation exists on the last line of the outer-block, the outer `map` invocation will return the transformed array `[[2, 4], [6, 8]]`.
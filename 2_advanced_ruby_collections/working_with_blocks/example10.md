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
The block will return:
```ruby
# => [[[2, 3], [4, 5]], [6, 7]]
```
On line 1, the `map` method is called on the three-dimensional array object `[[[1, 2], [3, 4]], [5, 6]]` and gets passed a `do...end` block as an argument, binding each of the 2 outer arrays (`[[1, 2], [3, 4]]` and `[5, 6]`) to the block's parameter `arr` throughout iteration. Upon each iteration of the block, the `map` method is called again on `arr` and gets passed another `do...end` block as an argument, binding each element of the current sub-array to the block's parameter `el` throughout iteration.

Upon each iteration of the inner block, an `if` statement is employed, which checks whether the current element is an integer or an array. If an integer, the `if` branch is executed, which simply returns the sum of the integer and `1`. Because the second element `[5, 6]` contains integers, it is passes through the `if` branch and returns `[6, 7]`.

If not an integer (an array), the `else` branch is executed, which calls `map` once more on `el`, iterating through each element and returning the sum of the element and `1`. This returns `[[2, 3], [4, 5]]` in total, which added to the `if` branch return will return `[[[2, 3], [4, 5]], [6, 7]]` from the outermost `map` invocation.
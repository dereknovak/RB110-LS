numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

=begin
Upon each iteration of the block, the current element will be output by
invocation of the `p` method, then the first element will be deleted by 
invocation of the `shift` method. After this first iteration, the loop moves
onto the 2nd iteration number, which is `3` after deleting `1` from the array.
This is why `3` is output. When, again, deleting the first element [`2`], the
following loop will be iteration 3; however, there are only 2 elements in
total, therefore the loop stops.
=end

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

=begin
Upon each iteration of the block, the current element will be output by
invocation of the `p` method and the last element of `numbers` will be deleted.
The first iteration will output `1` and delete `4`, the second iteration will
ouput `2` and delete `3`. Because the remainder of the original array has been
deleted, the loop stops with only the 2 outputs.
=end

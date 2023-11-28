```ruby
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]
```
On line 1, the `select` method is called on the array object `[{ a: 'ant', b: 'elephant' }, { c: 'cat' }]` and gets passed a `do...end` block, binding each sub-hash to the block's parameter `hash` throughout iteration. Upon each iteration of the block, the `all?` method is called on the current hash and gets passed a `do...end` block, binding each key-value pair to the block's parameters `key` and `value` throughout iteration. Each iteration of the inner block checks whether the first character of the current value is equal to the key in string syntax. `all?` will only evaluate as true if all pairs are truthy; because `b: 'elephant'` does not, the first hash does not evaluate as true, but the second hash containing only `c: 'cat'` does. `select` returns only truthy elements, so only `{ :c => 'cat'}` will be returned.

If `all?` were changed to `any?`, the entire original array would be returned. This is because `any?` returns `true` if any of its elements evaluate as true. Because `a: 'ant'` evaluates as true, the entire hash is considered truthy, and therefore would return along with `{ c: 'cat' }`.
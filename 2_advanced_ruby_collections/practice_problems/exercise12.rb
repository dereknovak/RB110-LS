arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

hsh = arr.each_with_object({}) { |array, hash| hash[array[0]] = array[1] }
  
p hsh
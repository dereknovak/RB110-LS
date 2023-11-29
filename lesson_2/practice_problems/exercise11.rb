arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

arr2 = arr.map { |array| array.select { |num| num % 3 == 0 } }

p arr2
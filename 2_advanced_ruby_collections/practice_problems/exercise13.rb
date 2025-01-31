arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

arr2 = arr.sort do |a, b|
          a = a.select { |num| num.odd? }
          b = b.select { |num| num.odd? }
          a <=> b
        end
p arr2
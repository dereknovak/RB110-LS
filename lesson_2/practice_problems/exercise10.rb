new_arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hash|
  hash.transform_values { |v| v + 1 }
end

p new_arr

new_arr2 = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hash|
  incremented_hash = {}
  hash.each { |k, v| incremented_hash[k] = v + 1 }
  incremented_hash
end

p new_arr2

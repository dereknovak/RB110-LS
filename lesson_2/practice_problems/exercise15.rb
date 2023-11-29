arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# Original Problem
even_hashes = arr.select { |hash| hash.values.flatten.all?(&:even?) }
p even_hashes

# Returning even keys
even_keys = arr.map { |hash| hash.select { |k, v| v.all?(&:even?) } }
p even_keys

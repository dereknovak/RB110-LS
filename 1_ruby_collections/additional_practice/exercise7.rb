statement = "The Flintstones Rock"

letter_count = {}

statement.each_char do |char|
  if letter_count.include?(char)
    letter_count[char] += 1
  else
    letter_count[char] = 1
  end
end

p letter_count
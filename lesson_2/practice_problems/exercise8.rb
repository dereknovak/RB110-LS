hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

VOWELS = 'aeiou'

hsh.each_value do |array|
  array.each do |string|
    string.each_char do |char|
      puts char if VOWELS.include?(char)
    end
  end
end
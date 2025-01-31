words = 'the flintstones rock'

def titleize(str)
  words_array = str.split

  words_array.map! do |word|
    word.capitalize!
  end

  words_array.join(' ')
end

puts titleize(words)

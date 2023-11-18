flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! do |name|
  until name.length == 3
    name.chop!
  end

  name
end

p flintstones

def random_uuid
  uuid_arr = []
  counter = 0
  
  loop do
    break if uuid_arr.size == 36
    if [8, 13, 18, 23].include?(counter)
      uuid_arr << '-'
    else
      uuid_arr << [rand(1..9), ('a'..'f').to_a.sample].sample
    end
    counter += 1
  end

  uuid_arr.join
end

puts random_uuid
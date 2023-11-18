flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

be_index = flintstones.index { |name| name.start_with?('Be') }

p be_index
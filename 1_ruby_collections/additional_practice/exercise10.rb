munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female" }
}

munsters.each do |k, v|
  if v['age'] <= 17
    v['age_group'] = 'kid'
  elsif v['age'] <= 64
    v['age_group'] = 'adult'
  else
    v['age_group'] = 'senior'
  end
end

puts munsters
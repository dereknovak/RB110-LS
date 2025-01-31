hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}
details_arr = []

hsh.each_value do |details|
  if details[:type] == 'fruit'
    details_arr << details[:colors].map(&:capitalize)
  else
    details_arr << details[:size].upcase
  end
end

p details_arr
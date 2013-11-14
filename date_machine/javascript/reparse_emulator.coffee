take_ = 0
function_name_ = 1
tree_ = 2

reparse_emulator = (take, function_name, tree, matches, functions) ->
  results = []
  current_position = 0
  for element_index of tree
    element = tree[element_index]
    relevent_matches = matches.slice(current_position, current_position + element[take_])
    console.log relevent_matches + " ->"
    results.push reparse_emulator(element[take_], element[function_name_], element[tree_], relevent_matches, functions)
    current_position += element[take_]
  
  if tree.length is 0
    execute_function function_name, matches.slice(0, take), functions, true
  else
    execute_function function_name, results, functions, true

execute_function = (function_name, arguments_, functions, is_type) ->
  console.log function_name + " w/ " + arguments_
  out = functions[function_name].apply functions[function_name], arguments_
  console.log out
  out
  
# Run
patt = new RegExp(parser_description[1].regex, "gi")

o = patt.exec("June 1-3").slice(1)
p = parser_description[1].tree
console.log reparse_emulator(p[0], p[1], p[2], o, functions)
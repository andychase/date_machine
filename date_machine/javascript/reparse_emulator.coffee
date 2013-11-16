take_ = 0
function_name_ = 1
tree_ = 2


overlapping = (start1, end1, start2, end2) ->
    return not ((start1 <= start2 and start1 <= end2 and end1 <= end2 and end1 <= start2) or
                (start1 >= start2 and start1 >= end2 and end1 >= end2 and end1 >= start2))


overlapping_at = (start, end, current) ->
    output = []
    for current_index of current
        [_, c_start, c_end] = current[current_index]

        if overlapping(c_start, c_end, start, end)
            output.push current_index
    return output

remove_lower_overlapping = (current, higher) ->
    for [match, h_start, h_end] in higher
        overlaps = overlapping_at(h_start, h_end, current)
        for overlap in overlaps
            delete current[overlap]
        if overlaps.length > 0
            # Keeps order in place
            current.splice(overlaps[0], 0, [match, h_start, h_end])
        else
            current.push([match, h_start, h_end])

    return current

get_results = (_) -> (_[i][2] for i of _)
any = (_) -> _? and ((not (_ instanceof Array )) or _.filter((a)->a?).length > 0)
get_best = (_) ->
    get_results(_.reduce(remove_lower_overlapping, []))

reparse_emulator = (take, function_name, tree, matches, functions) ->
  results = []
  current_position = 0
  for element_index of tree
    element = tree[element_index]
    relevent_matches = matches.slice(current_position, current_position + element[take_])
    results.push reparse_emulator(element[take_], element[function_name_], element[tree_], relevent_matches, functions)
    current_position += element[take_]
  
  if tree.length is 0
    execute_function function_name, matches.slice(0, take), functions, true
  else
    execute_function function_name, results, functions, true

execute_function = (function_name, arguments_, functions, is_type) ->
    functions[function_name].apply functions[function_name], arguments_

# Compile
for pattern in parser_description
  pattern.regex = new RegExp(pattern.regex, "gi")

# Run
this.date_machine = (input) ->
  out = []
  for pattern in parser_description
    regex = pattern.regex
    [take, function_name, tree] = pattern.tree
    while (o = regex.exec(input)) isnt null
      matcher_output = reparse_emulator(take, function_name, tree, o.slice(1), functions)
      # Get the index of the end of the match
      end = regex.lastIndex
      # Get start of match
      start = regex.lastIndex - o[0].length
      if any(matcher_output)
        out.push [pattern.order, [start, end, matcher_output]]
  return get_best(out.sort((a,b)->a[0]-b[0]))

console.log this.date_machine('8 pm Thursday, 7:30 and 10 pm Friday-Saturday, Sept. 13-15.')

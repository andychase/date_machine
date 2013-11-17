This file defines the date parser (this.date_machine).

In order to work it needs a parser_description, and functions to run based off it.

To understand the purpose of the overlapping functions first see ```parser_description```
and see that the each pattern has an 'order', that defines how complex the pattern is looking for.


The a leaf node of the parse tree looks like this ```[3, 'month', [...]]```.

- ```3``` is how many capture groups to **take** and pull into the next level of recursion.
- ```'month'``` is the string **function_name** corresponding to the function to run on the output of the tree
- ```'[...]'``` is another leaf node **tree**. At the bottom of the tree this is empty,
  and the function runs over the capture groups themselves. Then, the results
  bubble up to the top of the tree, being processed by the named functions along the way.

The emulator as a whole acts on a the result set of a regular expression from a single pattern.
It's recursive, so its arguments look like the structure of a leaf nodes.

        reparse_emulator = (take, function_name, tree, matches, functions) ->
          results = []
          current_position = 0
          for element in tree
            [element_take, element_function_name, element_tree] = element

            relevent_matches = matches.slice(current_position, current_position + element_take)
            results.push reparse_emulator(element_take, element_function_name, element_tree, relevent_matches, functions)
            current_position += element_take

          if tree.length is 0
            execute_function function_name, matches.slice(0, take), functions, true
          else
            execute_function function_name, results, functions, true

        execute_function = (function_name, arguments_, functions, is_type) ->
          functions[function_name].apply(functions[function_name], arguments_)

Finally it's important to set up each regular expression
so they are regex objects instead of simple strings.

        for pattern in parser_description
          pattern.regex = new RegExp(pattern.regex, "gi")

This is just for testing

        console.log this.date_machine('01/1/2011')

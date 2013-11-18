This file defines the date parser (this.dateMachine).

In order to work it needs a parserDescription, and functions to run based off it.

To understand the purpose of the overlapping functions first see ```parserDescription```
and see that the each pattern has an 'order', that defines how complex the pattern is looking for.


The a leaf node of the parse tree looks like this ```[3, 'month', [...]]```.

- ```3``` is how many capture groups to **take** and pull into the next level of recursion.
- ```'month'``` is the string **functionName** corresponding to the function to run on the output of the tree
- ```'[...]'``` is another leaf node **tree**. At the bottom of the tree this is empty,
  and the function runs over the capture groups themselves. Then, the results
  bubble up to the top of the tree, being processed by the named functions along the way.

The emulator as a whole acts on a the result set of a regular expression from a single pattern.
It's recursive, so its arguments look like the structure of a leaf nodes.

        reparseEmulator = (take, functionName, tree, matches, functions) ->
          results = []
          currentPosition = 0
          for element in tree
            [elementTake, elementFunctionName, elementTree] = element

            releventMatches = matches.slice(currentPosition, currentPosition + elementTake)
            results.push reparseEmulator(elementTake, elementFunctionName, elementTree, releventMatches, functions)
            currentPosition += elementTake

          if tree.length is 0
            executeFunction functionName, matches.slice(0, take), functions, true
          else
            executeFunction functionName, results, functions, true

        executeFunction = (functionName, arguments_, functions, isType) ->
          functions[functionName].apply(functions[functionName], arguments_)

Finally it's important to set up each regular expression
so they are regex objects instead of simple strings.

        for pattern in parserDescription
          pattern.regex = new RegExp(pattern.regex, "gi")

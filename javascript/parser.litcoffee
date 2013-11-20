We can assume that higher ordered patterns return more complex results than lower ordered patterns.
So if we come across an input like ```Oct. 1-2```, one pattern might match ```Oct. 1```, and another
```Oct. 1-2```, with the latter having a higher order. Because dateMachine can operates on
full text machines, it's not enough to simply discard all results but the highest ordered one.
Instead we have to find the best match per section of text.

The best match is found by removing results that overlap with higher-ordered results.

        overlapping = (start1, end1, start2, end2) ->
            return not ((start1 <= start2 and start1 <= end2 and end1 <= end2 and end1 <= start2) or
                        (start1 >= start2 and start1 >= end2 and end1 >= end2 and end1 >= start2))


        overlappingAt = (start, end, current) ->
            output = []
            for currentIndex of current
                [_, cStart, cEnd, _] = current[currentIndex]

                if overlapping(cStart, cEnd, start, end)
                    output.push currentIndex
            return output

        removeLowerOverlapping = (current, higher) ->
            [order, hStart, hEnd, match] = higher
            overlaps = overlappingAt(hStart, hEnd, current)
            for overlap in overlaps
                current.splice(overlap, 1)
            if overlaps.length > 0
                # Keeps order in place
                current.splice(overlaps[0], 0, higher)
            else
                current.push(higher)

            return current

Helper functions

        asList = (_) -> [].concat(_)
        getResults = (_) -> (i[3] for i in _)
        any = (_) -> _? and ((not (_ instanceof Array )) or _.filter((a)->a?).length > 0)
        getBest = (_) ->
            getResults(_.reduce(removeLowerOverlapping, []))
        sortByOrderAscending = (_) -> _.sort((a,b)->a[0]-b[0])
        getCaptureGroups = (_) -> _.slice(1)
        matchedTextLength = (_) -> _[0].length


This is the actual parser function, ```this.dateMachine``` should be the only thing exported by dateMachine.js.

        this.dateMachine = (input) ->
            dateMachineOutput = []
            for pattern in parserDescription
                regex = pattern.regex
                [take, functionName, tree] = pattern.tree
                while (matches = regex.exec(input)) isnt null
                    matcherOutput = reparseEmulator(take, functionName, tree, getCaptureGroups(matches), functions)

                    start = regex.lastIndex - matchedTextLength(matches)
                    end = regex.lastIndex - 1
                    if any(matcherOutput)
                        dateMachineOutput.push [pattern.order, start, end, asList(matcherOutput)]

              return getBest(sortByOrderAscending(dateMachineOutput))

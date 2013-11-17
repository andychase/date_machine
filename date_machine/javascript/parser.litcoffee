We can assume that higher ordered patterns return more complex results than lower ordered patterns.
So if we come across an input like ```Oct. 1-2```, one pattern might match ```Oct. 1```, and another
```Oct. 1-2```, with the latter having a higher order. Because date_machine can operates on
full text machines, it's not enough to simply discard all results but the highest ordered one.
Instead we have to find the best match per section of text.

The best match is found by removing results that overlap with higher-ordered results.

        overlapping = (start1, end1, start2, end2) ->
            return not ((start1 <= start2 and start1 <= end2 and end1 <= end2 and end1 <= start2) or
                        (start1 >= start2 and start1 >= end2 and end1 >= end2 and end1 >= start2))


        overlapping_at = (start, end, current) ->
            output = []
            for current_index of current
                [_, c_start, c_end, _] = current[current_index]

                if overlapping(c_start, c_end, start, end)
                    output.push current_index
            return output

        remove_lower_overlapping = (current, higher) ->
            [order, h_start, h_end, match] = higher
            overlaps = overlapping_at(h_start, h_end, current)
            for overlap in overlaps
                current.splice(overlap, 1)
            if overlaps.length > 0
                # Keeps order in place
                current.splice(overlaps[0], 0, higher)
            else
                current.push(higher)

            return current

Helper functions

        as_list = (_) -> [].concat(_)
        get_results = (_) -> (i[3] for i in _)
        any = (_) -> _? and ((not (_ instanceof Array )) or _.filter((a)->a?).length > 0)
        get_best = (_) ->
            get_results(_.reduce(remove_lower_overlapping, []))
        sort_by_order_ascending = (_) -> _.sort((a,b)->a[0]-b[0])
        get_capture_groups = (_) -> _.slice(1)
        matched_text_length = (_) -> _[0].length


This is the actual parser function, ```this.date_machine``` should be the only thing exported by date_machine.js.

        this.date_machine = (input) ->
            date_machine_output = []
            for pattern in parser_description
                regex = pattern.regex
                [take, function_name, tree] = pattern.tree
                while (matches = regex.exec(input)) isnt null
                    matcher_output = reparse_emulator(take, function_name, tree, get_capture_groups(matches), functions)

                    start = regex.lastIndex - matched_text_length(matches)
                    end = regex.lastIndex - 1
                    if any(matcher_output)
                        date_machine_output.push [pattern.order, start, end, as_list(matcher_output)]

              return get_best(sort_by_order_ascending(date_machine_output))
### This file

The logic in this file builds the date object.

If you compare this file to the ```python/functions.py``` file
you'll notice they are very similiar. That's intentional,
this file was ported over and kept such that it would be somewhat
easy to port changes back and forth.

There is a slight difference in these javascript functions vs python ones
Normally types would receive 1 array, but instead it receives each "subtype" as arguments
I just use ... splat to get all arguments as an array.

### Terminology

Because it's so confusing here is a list of the different levels to refer to:

- Groups 
  -- This is the capture groups. The lowest level. ```([0-9])``` etc.
  "Day", "Month", etc.
- Expressions 
  -- This is an expression with multiple capture groups. They're usually named
  after the person that wrote them. "Greg Burns", etc.
  
  In Python, Expressions functions have nice named arguments, def expr(Day, Month, Year),
  but Javascript doesn't support this.
- Type
  -- This is a collection of expressions with a common goal.
  Months (Jan, 0-12, January, etc.). 
- Patterns
  -- This is a collection of types ```<Month>/<Day>/<Year>```
  Patterns can have 

### Warning

A note about the above list. Types and Groups are commonly mixed up.
I think groups SHOULD be the lowest 
(because they are the actual capture *groups* in regular expressions)
but a group of expressions also makes sense.

It's so confusing that there are at least a couple places here that I've
also mixed myself up and probably in the documentation for RE|PARSE as well.

---

I use named tuples in python, and _replace mirrors the functionality of 
date._replace.. that is that it returns a copy of the date with only
certain things changed and leaves the old well enough alone.

        _replace = (_old, _new) ->
            year:   if _new.year? then _new.year else _old.year
            month:  if _new.month? then _new.month else _old.month
            day:    if _new.day? then _new.day  else _old.day
            hour:   if _new.hour? then _new.hour else _old.hour
            minute: if _new.minute? then _new.minute else _old.minute
            second: if _new.second? then _new.second else _old.second
            am_pm:  if _new.am_pm? then _new.am_pm else _old.am_pm

I represent lengths of dates (i.e. Thursday, 1-2pm) with a timedelta that goes right
after the date hash in the result array.

In Javascript, I'm just going to represent a timedelta with a hash.
I make a pretty dumb assumption that timedelta will only cross hour/minutes/second boundaries.

        timedelta_from_Date = (start_time, end_time) ->
            seconds_difference = 0
            if start_time.hour? and end_time.hour?
              seconds_difference += 60*60*(end_time.hour - start_time.hour)

              if start_time.minute? and end_time.minute?
                seconds_difference += 60*(end_time.minute - start_time.minute)

                if start_time.second? and end_time.second?
                  seconds_difference += end_time.second - start_time.second

            hours = Math.floor(seconds_difference/60/60)
            minutes = Math.floor(seconds_difference/60) - (hours * 60)
            seconds = seconds_difference - (minutes * 60) - (hours * 60 * 60)

            return {
               timedelta: true
               hours: hours
               minutes: minutes
               seconds: seconds
            }


This is just a helper function

        in_array = (arr, _) -> arr.indexOf(_) != -1

```progressive_match``` is useful for matching abbreviations
and full spellings. Functions like this could be useful
to help parse fuzzy matches in the future (i.e. misspellings of months).

        progressive_match = (string, possibilities) ->
            part = ""
            if not string? then return
            for character in string.toLowerCase()
                part += character
                matches = []
                for month, value of possibilities
                    if month.indexOf(part) > -1
                        matches.push(month)
                if matches.length == 1
                    return possibilities[matches[0]]
### Types

The heading above is the heading in the python source.
I actually don't know if it's referring to collections of expressions
or capture groups.

        month_to_number = (month_string) ->
          months =
              "january": 1
              "february": 2
              "march": 3
              "april": 4
              "may": 5
              "june": 6
              "july": 7
              "august": 8
              "september": 9
              "october": 10
              "november": 11
              "december": 12
           return progressive_match(month_string, months)

        weekday_to_number = (WeekdayString ) ->
            weekday_list = {
                "monday": 0,
                "tuesday": 1,
                "wednesday": 2,
                "thursday": 3,
                "friday": 4,
                "saturday": 5,
                "sunday": 6,
            }
            return progressive_match(WeekdayString, weekday_list)

I serialize am_pm by converting the hours to milliary/24-hour time format.
I also include ```am_pm: 'pm'``` in the date format to show that that transformation
was done. Making that clear helpful because if you get a time like 1, with no ```am_pm```
designation you might want to assume pm and add 12. This is not done in the libary because
date_machine strives for honesty, not guesswork.

        am_pm = (input) ->
            if not input?
              return
            if input.toLowerCase() == "am" then 0
            else if input.toLowerCase() == "pm" then 12

You can see in this function that I try not to repeat logic and use other
functions. In this case I might have been able to simply put time_expression
in the functions hash/object, but in python it makes a difference due to named arguments.
I'm going to leave it as-is for clarity.

        military_time = (MilHour, MilMinute, MilSecond ) ->
            return time_expression(MilHour, MilMinute, MilSecond, undefined)

Here is the ampm conversion. I omit returns when the expressions are simple,
but later on I want to use them as much as possible to make my intentions clear.

        noon = (hour, AMPM) -> hour == 12 and AMPM == 12
        midnight = (hour, AMPM) -> hour == 12 and AMPM == 0

        time_expression = (Hour, Minute, Second, AMPM, SpecialTimeText ) ->
            if not Hour? and not Minute? and not Second? and not AMPM? and not SpecialTimeText?
                return
            if SpecialTimeText
                if SpecialTimeText.toLowerCase() == "noon"
                    return {hour: 12}
                if SpecialTimeText.toLowerCase() == "midnight"
                    return {hour: 0}
            d = {}
            if Hour
                d.hour = Number(Hour)
            if Minute
                d.minute = Number(Minute)
            if Second
                d.second = Number(Second)
            if AMPM?
                if d.hour
                    if noon(d.hour, AMPM)
                        d.hour = 12
                    else if midnight(d.hour, AMPM)
                        d.hour = 0
                    else
                        d.hour = d.hour + AMPM
                d.am_pm = AMPM
            if [d.hour, d.minute, d.second] == [undefined, undefined, undefined]
                return undefined
            return d


        time_and_time = (Hour, Minute, AMPM1, Hour2, Minute2, AMPM2) ->
            if AMPM2?
                AMPM2 = am_pm(AMPM2)
            if not AMPM1? and not AMPM2?
                return [time_expression(Hour, Minute), time_expression(Hour2, Minute2)]
            else if not AMPM1?
                return [time_expression(Hour, Minute, undefined, AMPM2),
                        time_expression(Hour2, Minute2, undefined, AMPM2)]
            else if not AMPM2?
                return [time_expression(Hour, Minute, undefined, AMPM1),
                        time_expression(Hour2, Minute2, undefined, AMPM1)]


        month_type = (input...) ->
            for value in input
                if value?
                    return Number(value)


        date_number = (Day, Abbr) -> if Day? then Number(Day)

        month_number = (MonthNum) -> Number(MonthNum)

        month_num_type = (input) -> Number(input)

        year = (Year) -> if Year? then Number(Year)

        get_first_defined = (_) ->
          for item in _
            if item?
              return item

### Patterns

There's a some unwrapping values out of arrays here.
Because of the namedarguments issue functions receive a lot more
arrays then in Python and so they need to be unwrapped.

Sometimes the value is [undefined, undefined, <value>],
so I need to search for it and find it.

        weekday_range_with_time = (time1, time2, [weekday1], [weekday2], MonthRange) ->
            output = []

            # Get first undefined value
            # Since only one value in list will be defined (if any)
            time1 = get_first_defined(time1)
            time2 = get_first_defined(time2)

            if time1?
                for date in MonthRange
                    output.push(_replace(date, time1))
                    if time2?
                        output.push(_replace(date, time2))
            return output


        weekday_range_with_extra = ( time, and_time, weekday_start, weekday_end, extra_time, extra_weekday, MonthRange) ->
            output = []
            if time?
                for date in MonthRange
                    if date.weekday?
                        if date.weekday in [weekday_start .. weekday_end]
                            output.push(_replace(date, time))
                            if and_time?
                                output.push(_replace(date, and_time))
                        if date.weekday == extra_weekday
                            output.push(_replace(date, extra_time))
            return output


        weekday_range_with_extra_backwards = (extra_time, extra_weekday, time, weekday_start, weekday_end, MonthRange ) ->
            return weekday_range_with_extra(time[0], time[1], weekday_start, weekday_end, extra_time, extra_weekday, MonthRange )


        reverse_basic_text = (time, day, month, year) ->
            return basic_text(time, undefined, undefined, month, day, year)


        basic_text = (time, first_second, weekday, month, day, year) ->
            if not day?
                day = 1
            if (day instanceof Array) and day.length == 1
              day = day[0]
            if (year instanceof Array) and year.length == 1
              year = year[0]
            if not time?
                return {year: year, month: month, day: day}
            else
                year: year
                month: month
                day: day
                hour: time.hour
                minute: time.minute
                second: time.second
                am_pm: time.am_pm


        slash = (month, day, year, time) ->
            return basic_text(time, undefined, undefined, month, day, year)


        month_range = (month, date_a, date_b) ->
            output = []
            for day in [date_a[0] .. date_b[0]]
                output.push(basic_text(undefined, undefined, undefined, month, day, undefined))
            return output


        multi_time = (time1, BasicText) ->
            output = []
            if time1? and BasicText?
                output.push(_replace(BasicText, time1))
                output.push(BasicText)
                return output


        large_repeat_words = ->
            return undefined


        weekday_range_with_time_range = (time1, weekday_range) ->
            output = []
            if time1? and weekday_range?
                range = timedelta_from_Date(_replace(weekday_range[0], time1), weekday_range[0])
                for weekday in weekday_range
                    output.push(_replace(weekday, {hour:time1.hour, minute:time1.minute, am_pm:time1.am_pm}))
                    output.push(range)
                return output


        time_range = (unstrict_time, strict_time, date, reverse) ->
            endtime = date
            starttime = endtime
            if unstrict_time
                starttime = _replace(starttime, {hour:Number(unstrict_time[0])})
                if date.am_pm
                    starttime = _replace(starttime, {hour: starttime.hour + date.am_pm, am_pm:date.am_pm})
            else
                starttime = _replace(starttime, {hour: strict_time.hour, minute: strict_time.minute})

            time_range = timedelta_from_Date(starttime, endtime)
            if reverse
                time_range = timedelta_from_Date(endtime, starttime)
            return [starttime, time_range]


        alt_time_range = (first_second, weekday, month, day, year, time, unstrict_time, strict_time) ->
            return time_range(unstrict_time, strict_time, basic_text(time, first_second, weekday, month, day, year), reverse)


        until_range = (date1, date2) ->
            if date1 and date2
                return [date1, timedelta_from_Date(date1, date2)]


        through_range = (time, weekday1, weekday2, month, date, beginning) ->
            output = []
            if month and date and beginning and weekday1
                ending =
                    month: month
                    day: date
                for day in [beginning.day .. ending.day]
                    temp =
                        month: month
                        day: date
                    if temp.weekday and in_array([weekday1 .. weekday2], temp.weekday)
                        if time
                            output.push(_replace(temp, time))
                        else
                            output.push(temp)
                return output


### The function list

This hash/object matches all the functions with a
string that represents it in the parse tree.

        functions =
            # Groups
            "MonthString": month_to_number,
            "AMPM": am_pm,
            # Expressions
            "Chase Year": year,
            "Chase Date": date_number,
            "Chase Month": month_number,
            "Steve Valaitis": time_expression,
            "Greg Burns": (hour, am_pm) -> time_expression(hour, null, null, am_pm, null),
            "Greg Burns UnstrictTime:": time_expression,
            "Steve Valaitis2": military_time,
            "Steve Valaitis And Time": time_and_time,
            "Text Parts": time_expression,
            "Michael Ash10": weekday_to_number,
            # Types
            "Month": month_type,
            "MonthNum": month_num_type,
            # Patterns
            "LargeRepeatWords": large_repeat_words,
            "BasicText": basic_text,
            "ReverseBasicText": reverse_basic_text,
            "Slash": slash,
            "MonthRange": month_range,
            "MultiTime": multi_time,
            "WeekdayRangeWithTime": weekday_range_with_time,
            "WeekdayRangeWithExtra": weekday_range_with_extra,
            "WeekdayRangeWithExtraBackwards": weekday_range_with_extra_backwards,
            "WeekdayRangeWithTimeRange": weekday_range_with_time_range,
            "UntilRange": until_range,
            "ThroughRange": through_range,
            "TimeRange": time_range,
            "AltTimeRange": alt_time_range,

This is default expression or pattern. ```any``` means
if value is defined, and there is array with even a single defined value then return true.

            "_default": (_) ->
                if any(_) then _ else undefined

```Type``` there is used to mean collection of expressions.
I know that because only one will match, so you just have to find
it and return it.

            "_default_type": (_...) ->
                if _?
                    for item in _
                         if item?
                             return item

            "_default_group": (_...) -> if _[0]? then _[0]
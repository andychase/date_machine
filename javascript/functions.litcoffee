### This file

The logic in this file builds the date object.

If you compare this file to the ```python/functions.py``` file
you'll notice they are very similiar. That's intentional,
this file was ported over and kept such that it would be somewhat
easy to port changes back and forth.

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

### Warning

A note about the above list. Types and Groups are commonly mixed up.
I think groups SHOULD be the lowest 
(because they are the actual capture *groups* in regular expressions)
but a group of expressions also makes sense.

It's so confusing that there are at least a couple places here that I've
also mixed myself up and probably in the documentation for RE|PARSE as well.

---

I use named tuples in python, and ```_replace``` mirrors the functionality of 
```date._replace```.. that is that it returns a copy of the date with only
certain things changed and leaves the old well enough alone.

        _replace = (_old, _new) ->
            year:   if _new.year? then _new.year else _old.year
            month:  if _new.month? then _new.month else _old.month
            day:    if _new.day? then _new.day  else _old.day
            hour:   if _new.hour? then _new.hour else _old.hour
            minute: if _new.minute? then _new.minute else _old.minute
            second: if _new.second? then _new.second else _old.second
            amPm:  if _new.amPm? then _new.amPm else _old.amPm

I represent lengths of dates (i.e. Thursday, 1-2pm) with a timedelta that goes right
after the date hash in the result array.

In Javascript, I'm just going to represent a timedelta with a hash.
I make a pretty dumb assumption that timedelta will only cross hour/minutes/second boundaries.

        timedeltaFrom_Date = (startTime, endTime) ->
            secondsDifference = 0
            if startTime.hour? and endTime.hour?
              secondsDifference += 60*60*(endTime.hour - startTime.hour)

              if startTime.minute? and endTime.minute?
                secondsDifference += 60*(endTime.minute - startTime.minute)

                if startTime.second? and endTime.second?
                  secondsDifference += endTime.second - startTime.second

            hours = Math.floor(secondsDifference/60/60)
            minutes = Math.floor(secondsDifference/60) - (hours * 60)
            seconds = secondsDifference - (minutes * 60) - (hours * 60 * 60)

            return {
               timedelta: true
               hours: hours
               minutes: minutes
               seconds: seconds
            }


This is just a helper function

        inArray = (arr, _) -> arr.indexOf(_) != -1

```progressiveMatch``` is useful for matching abbreviations
and full spellings. Functions like this could be useful
to help parse fuzzy matches in the future (i.e. misspellings of months).

        progressiveMatch = (string, possibilities) ->
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


        monthToNumber = (monthString) ->
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
           return progressiveMatch(monthString, months)

        weekdayToNumber = (WeekdayString ) ->
            weekdayList = {
                "monday": 0,
                "tuesday": 1,
                "wednesday": 2,
                "thursday": 3,
                "friday": 4,
                "saturday": 5,
                "sunday": 6,
            }
            return progressiveMatch(WeekdayString, weekdayList)

I serialize amPm by converting the hours to milliary/24-hour time format.
I also include ```amPm: 'pm'``` in the date format to show that that transformation
was done. Making that clear helpful because if you get a time like 1, with no ```amPm```
designation you might want to assume pm and add 12. This is not done in the libary because
dateMachine strives for honesty, not guesswork.

        amPm = (input) ->
            if not input?
              return
            if input.toLowerCase() == "am" then 0
            else if input.toLowerCase() == "pm" then 12

I try not to repeat logic and use other functions when possible.
I could put ```"Steve Valaitis2": timeExpression``` to avoid this,
but I wrote it out to show that nothing special happens with 24-hour/military time.

        militaryTime = (MilHour, MilMinute, MilSecond ) ->
            return timeExpression(MilHour, MilMinute, MilSecond, undefined)

Here is the am/pm conversion. I omit returns when the expressions are simple,
but later on I want to use them as much as possible to make my intentions clear.

        noon = (hour, AMPM) -> hour == 12 and AMPM == 12
        midnight = (hour, AMPM) -> hour == 12 and AMPM == 0

This function gets called pretty often, I'd consider it the bulk
of the output logic.

        timeExpression = (Hour, Minute, Second, AMPM, SpecialTimeText ) ->
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
                d.amPm = AMPM
            if [d.hour, d.minute, d.second] == [undefined, undefined, undefined]
                return undefined
            return d

        timeAndTime = (Hour, Minute, AMPM1, Hour2, Minute2, AMPM2) ->
            if AMPM2?
                AMPM2 = amPm(AMPM2)
            if not AMPM1? and not AMPM2?
                return [timeExpression(Hour, Minute), timeExpression(Hour2, Minute2)]
            else if not AMPM1?
                return [timeExpression(Hour, Minute, undefined, AMPM2),
                        timeExpression(Hour2, Minute2, undefined, AMPM2)]
            else if not AMPM2?
                return [timeExpression(Hour, Minute, undefined, AMPM1),
                        timeExpression(Hour2, Minute2, undefined, AMPM1)]


        monthType = (input...) ->
            for value in input
                if value?
                    return Number(value)


        dateNumber = (Day, Abbr) -> if Day? then Number(Day)

        monthNumber = (MonthNum) -> Number(MonthNum)

        monthNumType = (input) -> Number(input)

        year = (Year) -> if Year? then Number(Year)

Sometimes the value is ```[undefined, undefined, <value>]```,
so I need to search for it and find it. There's enough
of these smaller expressions scattered around that moving them
all to one place might be good.

        getFirstDefined = (_) ->
          for item in _
            if item?
              return item

### Patterns

There's a some unwrapping values out of arrays here.
Because there's no named-arguments, functions receive a lot more
arrays here then in Python and so they need to be unwrapped.

        weekdayRangeWithTime = (time1, time2, [weekday1], [weekday2], MonthRange) ->
            output = []

            # Get first undefined value
            # Since only one value in list will be defined (if any)
            time1 = getFirstDefined(time1)
            time2 = getFirstDefined(time2)

            if time1?
                for date in MonthRange
                    output.push(_replace(date, time1))
                    if time2?
                        output.push(_replace(date, time2))
            return output


        weekdayRangeWithExtra = ( time, andTime, weekdayStart, weekdayEnd, extraTime, extraWeekday, MonthRange) ->
            output = []
            if time?
                for date in MonthRange
                    if date.weekday?
                        if date.weekday in [weekdayStart .. weekdayEnd]
                            output.push(_replace(date, time))
                            if andTime?
                                output.push(_replace(date, andTime))
                        if date.weekday == extraWeekday
                            output.push(_replace(date, extraTime))
            return output


        weekdayRangeWithExtraBackwards = (extraTime, extraWeekday, time, weekdayStart, weekdayEnd, MonthRange ) ->
            return weekdayRangeWithExtra(time[0], time[1], weekdayStart, weekdayEnd, extraTime, extraWeekday, MonthRange )


        reverseBasicText = (time, day, month, year) ->
            return basicText(time, undefined, undefined, month, day, year)


        basicText = (time, firstSecond, weekday, month, day, year) ->
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
                amPm: time.amPm


        slash = (month, day, year, time) ->
            return basicText(time, undefined, undefined, month, day, year)


        monthRange = (month, dateA, dateB) ->
            output = []
            for day in [dateA .. dateB]
                output.push(basicText(undefined, undefined, undefined, month, day, undefined))
            return output


        multiTime = (time1, BasicText) ->
            output = []
            if time1? and BasicText?
                output.push(_replace(BasicText, time1))
                output.push(BasicText)
                return output


        largeRepeatWords = ->
            return undefined


        weekdayRangeWithTimeRange = (time1, weekdayRange) ->
            output = []
            if time1? and weekdayRange?
                range = timedeltaFrom_Date(_replace(weekdayRange[0], time1), weekdayRange[0])
                for weekday in weekdayRange
                    output.push(_replace(weekday, {hour:time1.hour, minute:time1.minute, amPm:time1.amPm}))
                    output.push(range)
                return output


        timeRange = (unstrictTime, strictTime, date, reverse) ->
            endtime = date
            starttime = endtime
            if unstrictTime
                starttime = _replace(starttime, {hour:Number(unstrictTime[0])})
                if date.amPm
                    starttime = _replace(starttime, {hour: starttime.hour + date.amPm, amPm:date.amPm})
            else
                starttime = _replace(starttime, {hour: strictTime.hour, minute: strictTime.minute})

            timeRange = timedeltaFrom_Date(starttime, endtime)
            if reverse
                timeRange = timedeltaFrom_Date(endtime, starttime)
            return [starttime, timeRange]


        altTimeRange = (firstSecond, weekday, month, day, year, time, unstrictTime, strictTime) ->
            return timeRange(unstrictTime, strictTime, basicText(time, firstSecond, weekday, month, day, year), reverse)


        untilRange = (date1, date2) ->
            if date1 and date2
                return [date1, timedeltaFrom_Date(date1, date2)]


        throughRange = (time, weekday1, weekday2, month, date, beginning) ->
            output = []
            if month and date and beginning and weekday1
                ending =
                    month: month
                    day: date
                for day in [beginning.day .. ending.day]
                    temp =
                        month: month
                        day: date
                    if temp.weekday and inArray([weekday1 .. weekday2], temp.weekday)
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
            "MonthString": monthToNumber,
            "AMPM": amPm,
            # Expressions
            "Chase Year": year,
            "Chase Date": dateNumber,
            "Chase Month": monthNumber,
            "Steve Valaitis": timeExpression,
            "Greg Burns": (hour, amPm) -> timeExpression(hour, null, null, amPm, null),
            "Greg Burns UnstrictTime:": timeExpression,
            "Steve Valaitis2": militaryTime,
            "Steve Valaitis And Time": timeAndTime,
            "Text Parts": timeExpression,
            "Michael Ash10": weekdayToNumber,
            # Types
            "Month": monthType,
            "MonthNum": monthNumType,
            # Patterns
            "LargeRepeatWords": largeRepeatWords,
            "BasicText": basicText,
            "ReverseBasicText": reverseBasicText,
            "Slash": slash,
            "MonthRange": monthRange,
            "MultiTime": multiTime,
            "WeekdayRangeWithTime": weekdayRangeWithTime,
            "WeekdayRangeWithExtra": weekdayRangeWithExtra,
            "WeekdayRangeWithExtraBackwards": weekdayRangeWithExtraBackwards,
            "WeekdayRangeWithTimeRange": weekdayRangeWithTimeRange,
            "UntilRange": untilRange,
            "ThroughRange": throughRange,
            "TimeRange": timeRange,
            "AltTimeRange": altTimeRange,

This is default expression or pattern. ```any``` means
if value is defined, and there is array with even a single defined value then return true.

            "_default": (_) ->
                if any(_) then _ else undefined

Recall ```Type``` here means collection of expressions.
There only one will matching expression due to the way regex works ```(a)|(b)```,
so you just have to find it and return it.

            "_default_type": (_...) ->
                if _?
                    for item in _
                         if item?
                             return item

            "_default_group": (_...) -> if _[0]? then _[0]

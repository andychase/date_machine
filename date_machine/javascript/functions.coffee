# There is a slight difference in js functions vs python ones
# Normally types would receive 1 array, but instead it receives each "subtype" as arguments
# Just use ... splat to get all arguments as an array


Date = (year, month, day) ->
  year: year
  month: month
  day: day

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
## Types
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

am_pm = (input) ->
    if input.toLowerCase() == "am" then 0
    else if input.toLowerCase() == "pm" then 12


military_time = (MilHour, MilMinute, MilSecond ) ->
    return time_expression(MilHour, MilMinute, MilSecond, undefined)


noon = (hour, AMPM) -> hour == 12 and AMPM == 12
midnight = (hour, AMPM) -> hour == 12 and AMPM == 0


time_expression = (Hour, Minute, Second, AMPM, SpecialTimeText ) ->
    if SpecialTimeText
        if SpecialTimeText.toLowerCase() == "noon"
            return Date(hour)
        if SpecialTimeText.toLowerCase() == "midnight"
            return Date(hour)
    d = Date()
    if Hour
        d[hour] = Number(Hour)
    if Minute
        d[minute] = Number(Minute)
    if Second
        d[second] = Number(Second)
    if AMPM?
        if d.hour
            if noon(d.hour, AMPM)
                d = d._replace(hour)
            else if midnight(d.hour, AMPM)
                d = d._replace(hour)
            else
                d = d._replace(hour=d.hour + AMPM)
        d = d._replace(am_pm)
    if [d.hour, d.minute, d.second] != [undefined, undefined, undefined]
        return d


time_and_time = (Hour, Minute, AMPM1, Hour2, Minute2, AMPM2) ->
    if AMPM2 is not ""
        AMPM2 = am_pm(AMPM2)
    if not AMPM1 and not AMPM2
        return [time_expression(Hour, Minute), time_expression(Hour, Minute)]
    else if not AMPM1
        return [time_expression(Hour, Minute, AMPM),
                time_expression(Hour, Minute, AMPM)]
    else if not AMPM2
        return [time_expression(Hour, Minute, AMPM),
                time_expression(Hour, Minute, AMPM)]


# Date Functions

month_type = (input...) ->
    for value in input
        console.log value
        if value?
            return Number(value)


date_number = (Day, Abbr) ->
    if Day
        return Number(Day)


month_number = (MonthNum) ->
    return Number(MonthNum)


month_num_type = (input...) ->
    if type(input) is list
        return Number(input[0])
    else
        return Number(input)


year = (Year) ->
    if Year
        return Number(Year)

# Patterns #


weekday_range_with_time = (time1, time2, weekday1, weekday2, MonthRange) ->
    output = []
    if time1
        for date in MonthRange
            output.push(date.update(time1))
            if time2
                output.push(date.update(time2))
    return output


weekday_range_with_extra = ( \
        time, and_time, weekday_start, weekday_end,
        extra_time, extra_weekday, MonthRange) ->
    output = []
    if time
        for date in MonthRange
            if hasattr(date, 'weekday')
                if date.weekday in range(weekday_start, weekday_end + 1)
                    output.push(date.update(time))
                    if and_time
                        output.push(date.update(and_time))
                if date.weekday == extra_weekday
                    output.push(date.update(extra_time))
    return output


weekday_range_with_extra_backwards = (extra_time, extra_weekday, time, weekday_start, weekday_end, MonthRange ) ->
    return weekday_range_with_extra( time[0], time[1], weekday_start, weekday_end, extra_time, extra_weekday, MonthRange )


reverse_basic_text = (time, day, month, year) ->
    return basic_text(time, day, month, year)


basic_text = (time, first_second, weekday, month, day, year) ->
    if not day?
        day = 1
    if not time?
        return Date(year, month, day)
    if time?
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
    for day in [date_a[0] .. date_b[0] + 1]
        output.push(basic_text(undefined, undefined, undefined, month, day, undefined))
    return output


multi_time = (time1, BasicText) ->
    output = []
    if time1 and BasicText
        output.push(BasicText.update(time1))
        output.push(BasicText)
        return output


large_repeat_words = ->
    return undefined


weekday_range_with_time_range = (time1, weekday_range) ->
    output = []
    if time1 and weekday_range
        range = timedelta_from_Date(weekday_range[0].update(time1), weekday_range[0])
        for weekday in weekday_range
            output.push(weekday._replace(hour=time1.hour, minute=time1.minute, am_pm=time1.am_pm))
            output.push(range)
        return output


time_range = (unstrict_time, strict_time, date, reverse) ->
    endtime = date
    starttime = endtime
    if unstrict_time
        starttime = starttime._replace(hour=Number(unstrict_time[0]))
        if date.am_pm
            starttime = starttime._replace(hour=starttime.hour + date.am_pm, am_pm=date.am_pm)
    else
        starttime = starttime._replace(hour=strict_time.hour, minute=strict_time.minute)

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
        ending = Date(month, day)
        for day in range(beginning.day, ending.day + 1)
            temp = Date(month, day)
            if temp.weekday and temp.weekday in range(weekday1, weekday2 + 1)
                if time
                    output.push(temp.update(time))
                else
                    output.push(temp)
        return output


# --------------- The lists ------------------
functions = {
    # Groups
    "MonthString": month_to_number,
    "AMPM": am_pm,
    # Expressions
    "Chase Year": year,
    "Chase Date": date_number,
    "Chase Month": month_number,
    "Steve Valaitis": time_expression,
    "Greg Burns": time_expression,
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
    "_default": (_) ->
        if _? and (not (_ instanceof Array ) or Math.max([item? for item in _]) == 1)  then _ else undefined
    "_default_type": (_...) ->
        if _?
            for item in _
                 if item?
                     item
    , "_default_group": (_) -> if _? then _[0]
}

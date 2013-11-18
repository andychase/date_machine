        fillResult = (_) ->
          for resultSet in _
            for result in resultSet
              for key of result
                if not result[key]?
                  delete result[key]
          return _


        dateTest = (testString, answerObject...) =>
          deepEqual fillResult(this.dateMachine(testString)), [answerObject], testString

        dateRawTest = (testString, answerObject) =>
          deepEqual fillResult(this.dateMachine(testString)), answerObject, testString

        test "sanity", ->
          ok 1==1, "passed!"

        test "date tests", =>

            dateTest '01/1/2011',
                day: 1
                month: 1
                year: 2011


            dateRawTest 'All day Thursday-Sunday, Sept. 20-23., Friday September 21', [[
                    day: 20
                    month: 9
                ,
                    day: 21
                    month: 9
                ,
                    day: 22
                    month: 9
                ,
                    day: 23
                    month: 9
                ],[
                    day: 21
                    month: 9
                ]]

            dateTest '12/3/2012',
                    day: 3
                    month: 12
                    year: 2012
            dateTest 'Wednesday september 12',
                    day: 12
                    month: 9
            dateTest '10 pm, Friday September 21',
                    day: 21
                    month: 9
                    hour: 22
                    amPm: 12
            dateTest '9:30 pm, Friday September 2',
                    day: 2
                    month: 9
                    hour: 21
                    minute: 30
                    amPm: 12
            dateTest '10:30 pm., Wednesday September 12',
                    day: 12
                    month: 9
                    hour: 22
                    minute: 30
                    amPm: 12
            dateRawTest 'April 7 November 17',
                [[
                    day: 7
                    month: 4
                ],[
                    day: 17
                    month: 11
                ]]
            dateTest 'Sat, 09/01/2012 - 12:00pm',
                    day: 1
                    month: 9
                    year: 2012
                    hour: 12
                    minute: 0
                    amPm: 12
            dateTest '14 January 2013',
                    day: 14
                    month: 1
                    year: 2013
            dateTest 'January 11',
                    day: 11
                    month: 1
            dateTest '7- 9 pm Wednesday, Oct. 31',
                    month: 10
                    day: 31
                    hour: 19
                    amPm: 12
                ,
                    timedelta: true
                    hours: 2
                    minutes: 0
                    seconds: 0
            dateTest 'Sun, 06/16/2013 - 6:00pm',
                    hour: 18
                    month: 6
                    year: 2013
                    day: 16
                    minute: 0
                    amPm: 12

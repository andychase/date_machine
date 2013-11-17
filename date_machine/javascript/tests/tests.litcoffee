        fill_result = (_) ->
          for result_set in _
            for result in result_set
              for key of result
                if not result[key]?
                  delete result[key]
          return _


        date_test = (test_string, answer_object...) =>
          deepEqual fill_result(this.date_machine(test_string)), [answer_object], test_string

        date_raw_test = (test_string, answer_object) =>
          deepEqual fill_result(this.date_machine(test_string)), answer_object, test_string

        test "sanity", ->
          ok 1==1, "passed!"

        test "date tests", =>

            ok functions["time"]


            date_test '01/1/2011',
                day: 1
                month: 1
                year: 2011


            date_test 'All day Thursday-Sunday, Sept. 20-23., Friday September 21',
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

            date_test '12/3/2012',
                    day: 3
                    month: 12
                    year: 2012
            date_test 'Wednesday september 12',
                    day: 12
                    month: 9
            date_test '10 pm, Friday September 21',
                    day: 21
                    month: 9
                    hour: 22
                    am_pm: 12
            date_test '9:30 pm, Friday September 2',
                    day: 2
                    month: 9
                    hour: 21
                    minute: 30
                    am_pm: 12
            date_test '10:30 pm., Wednesday September 12',
                    day: 12
                    month: 9
                    hour: 22
                    minute: 30
                    am_pm: 12
            date_raw_test 'April 7 November 17',
                [[
                    day: 7
                    month: 4
                ],[
                    day: 17
                    month: 11
                ]]
            date_test 'Sat, 09/01/2012 - 12:00pm',
                    day: 1
                    month: 9
                    year: 2012
                    hour: 12
                    minute: 0
                    am_pm: 12
            date_test '14 January 2013',
                    day: 14
                    month: 1
                    year: 2013
            date_test 'January 11',
                    day: 11
                    month: 1
            date_test '7- 9 pm Wednesday, Oct. 31',
                    month: 10
                    day: 31
                    hour: 19
                    am_pm: 2
                ,
                    timedelta: true
                    hours: 2
            date_test 'Sun, 06/16/2013 - 6:00pm',
                    hour: 18
                    month: 6
                    year: 2013
                    day: 16
                    minute: 0
                    am_pm: 12

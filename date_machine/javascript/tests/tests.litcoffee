        fill_result = (_) ->
          for result_set in _
            for result in result_set
              for key of result
                if not result[key]?
                  delete result[key]
          return _


        date_test = (test_string, answer_object...) =>
          deepEqual fill_result(this.date_machine(test_string)), [answer_object]

        test "sanity", ->
          ok 1==1, "passed!"

        test "date tests", =>
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

            date_test 'Wednesday september 12',
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

            date_test '10 pm, Friday September 21',
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

            date_test '9:30 pm, Friday September 2',
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

            date_test '10:30 pm., Wednesday September 12',
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

            date_test '9:30 pm Wednesdays., Wednesday September 12',
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

            date_test '2 pm and 4 pm Sunday, Sept. 30, Sunday September 30',
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

            date_test '7:30 pm and 10 pm Friday-Saturday, Sept. 21-22. ',
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

            date_test '7:30 pm fourth Fridays, Friday November 23 ',
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

            date_test '8 pm Wednesday, Sept. 26.,',
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

            date_test '9 pm every first Tuesday of the month., Tuesday November 06',
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

            date_test '8:30 pm first Fridays of the month, Friday November 02 ',
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

            date_test '10 pm first and third Saturdays., Saturday September 15',
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

            date_test 'Noon-6 pm Saturday-Sunday, Sept. 22-23., Saturday September 22',
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

            date_test 'Seatings at 5 pm and 8 pm Sunday, Sept. 30., Sunday September 30',
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

            date_test 'April 7 November 17',
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

            date_test 'Sat, 09/01/2012 - 12:00pm',
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

            date_test '14 January 2013',
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

            date_test 'Oct. 31',
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

            date_test 'January 11',
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

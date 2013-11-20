from datetime import timedelta
from date_machine.functions import Date

corpus = {
    "Standard Slash Format": {
        "01/18/2013": [Date(month=1, day=18, year=2013)],
        "12/3/2012": [Date(month=12, day=3, year=2012)],
    },
    "Basic Text Format": {
        "Wednesday september 12": [Date(month=9, day=12)],
        "Wednesday September 12": [Date(month=9, day=12)],
        "Wednesday Sept. 12": [Date(month=9, day=12)],
        "10 pm, Friday September 21 ": [Date(month=9, day=21, hour=22, am_pm=12)],
        "9:30 pm, Friday September 21 ": [Date(month=9, day=21, hour=21, minute=30, am_pm=12)],
        "9 pm, Thursday January 03": [Date(month=1, day=03, hour=21, am_pm=12)]
    },
    "Lots of Text": {
        "All day Thursday-Sunday, Sept. 20-23., Friday September 21 ":
            [Date(month=9, day=20),
             Date(month=9, day=21),
             Date(month=9, day=22),
             Date(month=9, day=23)],
        "10:30 pm., Wednesday September 12 ": [Date(month=9, day=12, hour=22, minute=30, am_pm=12)],
        "9:30 pm Wednesdays., Wednesday September 12 ": [Date(month=9, day=12, hour=21, minute=30, am_pm=12)],
        "2 pm and 4 pm Sunday, Sept. 30, Sunday September 30 ":
            [Date(month=9, day=30, hour=14, am_pm=12), Date(month=9, day=30, hour=16, am_pm=12)],
        "7:30 pm and 10 pm Friday-Saturday, Sept. 21-22. ":
            [Date(month=9, day=21, hour=19, minute=30, am_pm=12),
             Date(month=9, day=21, hour=22,            am_pm=12),
             Date(month=9, day=22, hour=19, minute=30, am_pm=12),
             Date(month=9, day=22, hour=22,            am_pm=12)],
        "7:30 pm fourth Fridays, Friday November 23 ": [Date(month=11, day=23, hour=19, minute=30, am_pm=12)],
        #"7:30 pm Friday-Saturday and 3 pm Sunday, Sept. 21-23., Friday September 21 ":
        #    [Date(month=9, day=21, hour=19, minute=30),
        #     Date(month=9, day=22, hour=19, minute=30),
        #     Date(month=9, day=23, hour=15)],
        #"8 pm Thursday, 7:30 and 10 pm Friday-Saturday, Sept. 13-15., Friday September 14 ":
        #    [Date(month=9, day=13, hour=20, am_pm=12),
        #     Date(month=9, day=14, hour=19, minute=30),
        #     Date(month=9, day=14, hour=22, am_pm=12),
        #     Date(month=9, day=15, hour=19, minute=30),
        #     Date(month=9, day=15, hour=22, am_pm=12),
        #    ],
        "8 pm Wednesday, Sept. 26.,": [Date(month=9, day=26, hour=20, am_pm=12)],
        "9 pm every first Tuesday of the month., Tuesday November 06 ": [Date(month=11, day=6, hour=21, am_pm=12)],
                "Noon Saturday, Sept. 22 until midnight Sunday, Sept. 23., Saturday September 22 ":
                    [Date(month=9, day=22, hour=12), timedelta(hours=12)],
        "8:30 pm first Fridays of the month, Friday November 02 ": [
            Date(month=11, day=2, hour=20, minute=30, am_pm=12)],
        "10 pm first and third Saturdays., Saturday September 15 ": [Date(month=9, day=15, hour=22, am_pm=12)],
        "Noon-6 pm Saturday-Sunday, Sept. 22-23., Saturday September 22 ":
            [Date(month=9, day=22, hour=12),
             timedelta(hours=6),
             Date(month=9, day=23, hour=12),
             timedelta(hours=6)],
        #"8 pm Fridays-Saturdays through Oct. 13., Friday October 05 ":
        #    [Date(month=10, day=5, hour=20),
        #     Date(month=10, day=6, hour=20),
        #     Date(month=10, day=12, hour=20),
        #     Date(month=10, day=13, hour=20),
        #    ],
        "Seatings at 5 pm and 8 pm Sunday, Sept. 30., Sunday September 30 ":
            [Date(month=9, day=30, hour=17, am_pm=12), Date(month=9, day=30, hour=20, am_pm=12)],
        "9 pm Wednesday, Sept. 12.": [Date(month=9, day=12, hour=21, am_pm=12)],
    },
    "Multi-Dates": {
        "April 7 November 17": [Date(month=4, day=7), Date(month=11, day=17)],
        "December 1 - 2": [Date(month=12, day=1), Date(month=12, day=2)],
    },
    "Other": {
        "Sat, 09/01/2012 - 12:00pm": [Date(month=9, day=1, year=2012, hour=12, minute=0, am_pm=12)],
        "14 January 2013": [Date(month=1, day=14, year=2013)],
        "Oct. 31": [Date(month=10, day=31)],
        "January 11": [Date(month=1, day=11)],
    },
    "Confusing Dates": {
        "7- 9 pm Wednesday, Oct. 31": [Date(month=10, day=31, hour=19, am_pm=12), timedelta(hours=2)],
        "Sun, 06/16/2013 - 6:00pm": [Date(hour=18, month=6,  year=2013, day= 16, minute=0, am_pm=12)],
    }
}
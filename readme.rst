Date_Machine
============

Date Machine is a Date parsing system.

It is based on Reparse_, and includes 14 date patterns, and a Javascript version.

.. code-block:: python

      date_machine_parse('All day Thursday-Sunday, Sept. 20-23., Friday September 21')
      #       [Date(month=9, day=20),
      #        Date(month=9, day=21),
      #        Date(month=9, day=22),
      #        Date(month=9, day=23)],

- Fast
- Scannable: Use over full text and find dates
- Honest: no approximations given about the dates (i.e. if the year is missing it's not included)
- Portable: Parser description compiles to Regex/Json. You just have to write the output builder functions.
- Highly-Customizable: Adding more formats at different levels is easy (if you know regular expressions).

Installation
------------

    pip install date_machine
    
or

    python setup.py install

in the base directory.

Usage
-----

.. code-block:: python

    import date_machine
    date_machine.parse('Jan 1st')
    # [Date(month=1, day=11)]


Support
-------

Need some help? Send me an email at andy@asperous.us and I'll do my best to help you.

Contribution
------------

The code is located on Github_.
Send me suggestions, issues, and pull requests and I'll gladly review them!

Licence
-------

The MIT License (MIT)

Copyright (c) 2013 Andrew Chase

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

.. _Github: https://github.com/asperous/date_machine
.. _Reparse: https://github.com/asperous/reparse

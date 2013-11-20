Hey!

This is the javascript component of Date_Machine.

You can generate the parserDescription from the ../date_machine directory.
Just do::

    python cli.py js

and that will update the file.

The ```build.bat``` will generate the compiled ```dateMachine.js``` file,
```build.bat``` is both a valid dos batch file as well as a valid unix bash file.

I build it manually, but you can add a --watch to the commands in that file to compile it automatically on changes.

Everything is written in literate coffeescript, code begins after 8 spaces.
Unfortunately coffeescript isn't able to compile a mix of literate and illiterate, so everything is literate.

Have fun!

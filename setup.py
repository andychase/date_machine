#!/usr/bin/env python
import os
from setuptools import setup


def readme_or_docstring():
    path = os.path.join(os.path.dirname(__file__), 'readme.rst')
    if os.path.isfile(path):
        return open(path).read()
    else:
        import date_machine
        return date_machine.__doc__

setup(name='date_machine',
      version='0.2',
      description='The last date parser',
      long_description=readme_or_docstring(),
      author='Andy Chase',
      author_email='andy@asperous.us',
      url='http://asperous.github.io/date_machine',
      download_url="https://github.com/asperous/date_machine/archive/master.zip",
      license="MIT",
      packages=['date_machine'],
      install_requires=["reparse", "pyyaml"],
      classifiers=(
          'Development Status :: 4 - Beta',
          'Natural Language :: English',
          'License :: OSI Approved :: MIT License',
          'Programming Language :: Python',
          'Programming Language :: Python :: 2.7',
          'Topic :: Software Development :: Libraries :: Python Modules',
          'Topic :: Text Processing'
      ),
      )

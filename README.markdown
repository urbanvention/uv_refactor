# UV Refactor

A mixin class which defines some methods to help you refactor your codebase.

## Description

If you want to rename methods or relations, it helps to get some reminders that a refactoring is in progress.
Having methods which hold `refactor`, it becomes easier to spot those methods in your codebase.

## Installation

Standalone:

    gem install uv_refactor

With bundler:

    gem "uv_refactor"
    
## Usage

You have to include the Refactor module. Here is a silly example:
Imagine you'd like to rename 

    class User < ActiveRecord::Base
      include Refactor

      refactor_method :fullname, :name
    end
    
### Refactor methods

Creates an attribute accessor for `:new_method` and redirects `:old_method` to it.

    refactor_method :user, :buyer
    refactor_method :user, :seller
    refactor_method :amount, :credits
    
This will have these effects:

    Remove **user** in UnitTransaction.
    Missing migration for UnitTransaction **buyer**.
    Remove **user** in UnitTransaction.
    Missing migration for UnitTransaction **seller**.
    Remove **amount** in UnitTransaction.
    Missing migration for UnitTransaction **credits**.

After deleting `user` and `amount` you have these warnings left:

    Missing migration for UnitTransaction **buyer**.
    Remove **user** in UnitTransaction.
    Missing migration for UnitTransaction **seller**.
    Missing migration for UnitTransaction **credits**.

Additionally you have warnings, whenever you execute code.

I like it because when running the test suite, I can see beforehand where methods are which I'd like to refactor. Otherwise you have failing tests where dependencies overshadow the actual source of your planned refactoring.

## Changelog

* 2010-11-22: better stacktrace output
* 2010-11-21: Project created (0.0.1)

## Contributors

* Jan Riethmayer (@riethmayer, maintainer)

## LICENSE

(The MIT License)

Copyright (c) 2010 [urbanvention](http://urbanvention.com).

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

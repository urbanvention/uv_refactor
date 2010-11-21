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

    refactor_method old_method, new_method
    
## Configure the Refactorer

You are able to override the deprecation_method to fit your needs.

    # config/initializers/currency_updater.rb
    
    Refactor.setup do |config|
      config.deprecation_method = lambda {|old_method, new_method| 1.2345 }
    end

## Changelog

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

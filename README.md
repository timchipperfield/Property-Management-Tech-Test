#Property Management Tech Test [![Build Status](https://travis-ci.org/timchipperfield/property_mgmt_tt.svg?branch=master)](https://travis-ci.org/timchipperfield/property_mgmt_tt)[![Coverage Status](https://coveralls.io/repos/github/timchipperfield/Property-Management-Tech-Test/badge.svg?branch=master)](https://coveralls.io/github/timchipperfield/Property-Management-Tech-Test?branch=master)

#Description
This is a command-line application for a property management company which identifies which
estates are due for service charge payments. Table below shows the estates and
service charge due dates.


This system should remind financial officers about upcoming service charge due
dates so they can send demand letters to estates before the time.

For estates with service charge period 'Quarterly' system should remind
financial officers one calendar month before service charge due date.

For estates with service charge period 'Twice a year' system should remind
financial officers two calendar months before service charge due date.


Interface to the reminder system (Ruby):

    reminder = Reminder.new(reminder_rules)

    reminder.on(date, estates) # returns estate code and due date of estates
                               # needing reminders

#Running Instructions

To run the program from the command line, use irb and try the following commands at [the bottom of the feature test](https://github.com/timchipperfield/Property-Management-Tech-Test/blob/master/spec/feature_test_spec.rb)

To run all tests, type rpsec into the command line

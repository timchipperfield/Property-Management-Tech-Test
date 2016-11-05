require 'date'
require 'fixnum_method_addition'

#The reminder class takes rules as a param + can return reminders for a given date

class Reminder

  attr_reader :rules

  def initialize(reminder_rules = Rules.new)
    @rules = reminder_rules
  end

  def on(date, estates)
    reminder_estates_and_dates = estates_with_relevant_dates(date, estates)
    Printer.new.print(date, clean_formatting(reminder_estates_and_dates))
    return clean_formatting(reminder_estates_and_dates)
  end

  private

  def estates_with_relevant_dates(selected_date, estates)
  	selected_estates = []
  	estates.all.each do |estate|
  				months_before = @rules.evaluate(estate)
  				selected_estates << estate_dates(estate, selected_date, months_before)
  	end
  	selected_estates
  end

  def estate_dates(estate, selected_date, months_before)
  	estates = []
  	estate[:date_array].each do |estate_date|
  		parsed_estate_date = Date.parse(date_with_year(selected_date, estate_date))
  		estates << check_if_date_covered(selected_date, parsed_estate_date, months_before, estate[:estate_code])
  	end
  	estates
  end

  def date_with_year(selected_date, estate_date)
    selected_year = Date.parse(selected_date).year
  	estate_date + " " + selected_year.to_s
  end

  def check_if_date_covered(selected_date, estate_date, months_before, estate_code)
  	dates = []
  	if ((estate_date << months_before)..estate_date).cover?(Date.parse(selected_date))
  				dates << [estate_code, date_to_string(estate_date)]
  	end
  end

  def date_to_string(date)
    ordinal_day = date.day.ordinalize
    date.strftime("#{ordinal_day} %b %Y")
  end

  def clean_formatting(reminder_estates_and_dates)
    flattened = reminder_estates_and_dates.map {|estate| estate.compact.flatten }
    if flattened[1].empty?
      flattened.pop
    end
    check_if_no_reminders(flattened)
  end

  def check_if_no_reminders(flattened_reminder_array)
    if flattened_reminder_array[0].empty?
      flattened_reminder_array[0] = "(no reminders)"
    end
    return flattened_reminder_array
  end


end

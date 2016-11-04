require 'date'
require 'fixnum_method_addition'


class Reminder

  attr_reader :rules

  def initialize(reminder_rules)
    @rules = reminder_rules
  end

  def on(date, estates)
    information = estates_with_selected_dates(date, estates)
    clean_formatting(information)
  end

private

  def estates_with_selected_dates(selected_date, estates)
  	selected_estates = []
  	estates.all.each do |estate|
  				months_before = service_charge_months(estate)
  				selected_estates << estate_dates(estate, selected_date, months_before)
  	end
  	selected_estates
  end

  def service_charge_months(estate)
  	if estate[:service_charge_period] == "Quarterly"
  		1
  	elsif estate[:service_charge_period] == "Twice a year"
  		2
  	else raise "Estate Does Not Have a valid Service Charge Period"
  	end
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

  def clean_formatting(information)
    information.map {|estate| estate.compact.flatten }
  end

end

require 'date'

class Reminder

  attr_reader :rules

  def initialize(reminder_rules)
    @rules = reminder_rules
  end

  def on(date, estates)

  end






end


  {:date => "1st Jan 2009", :reminders => [{:estate_code => "0066S", :due_date => "1st Feb 2009"},
{:estate_code => "0250S", :due_date => "23rd Jan 2009"}]}


reminder_rules = 1

reminder = Reminder.new(reminder_rules)

estates = [
     {:estate_code => "0066S", :service_charge_period => "Quarterly", :date_array => ["1st Feb",  "3rd May",  "1st Aug",  "5th Nov"]},
     {:estate_code => "0250S", :service_charge_period => "Twice a year", :date_array => ["28th Feb", "31st May", "31st Aug", "30th Nov"]}]

def service_charge_months(estate)
	if estate[:service_charge_period] == "Quarterly"
		1
	elsif estate[:service_charge_period] == "Twice a year"
		2
	else raise "Estate Does Not Have a valid Service Charge Period"
	end
end



def test_meth(selected_date, estates)
	estates.each do |estate|
				months_before = service_charge_months(estate)
				selected_estate = []
				estate[:date_array].each do |estate_date|
						parsed_date = Date.parse(date_with_year(selected_date, estate_date))
						check_if_date_covered(selected_date, parsed_date, months_before, estate[:estate_code])
				end

	end
end

def date_with_year(selected_date, estate_date)
	estate_date + " " + selected_date.year.to_s
end

def check_if_date_covered(selected_date, estate_date, months_before, estate_code)
	dates = []
	if ((estate_date << months_before)..estate_date).cover?(selected_date)
				dates << estate_date
	end
	p [estate_code, dates]
end


d1 = Date.parse("1th Feb 2016")
# d2 = d1 << 1


# d3 = Date.parse("1st Feb 2016")

# (d2..d1).cover?(d3)

test_meth(d1, estates)

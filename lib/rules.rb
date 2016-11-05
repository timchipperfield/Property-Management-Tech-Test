#this class is an example set of rules that is by default injected into Reminder

class Rules

  def evaluate(estate)
  	if estate[:service_charge_period] == "Quarterly"
  		1
  	elsif estate[:service_charge_period] == "Twice a year"
  		2
  	else raise "Estate Does Not Have a valid Service Charge Period"
  	end
  end

end

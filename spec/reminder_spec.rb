require 'reminder'

describe Reminder do

  before(:each) do
    @new_rules = double
    @reminder = Reminder.new(@new_rules)
  end

  it "initializes with reminder_rules" do
    expect(@reminder.rules).to eq @new_rules
  end

  it "can return estates with their reminder dates" do
    expect(@reminder).to respond_to(:on).with(2).arguments
  end

  it "returns the reminder dates for a given date and estates" do
    @estates = double(:estates)
    @reminder_dates = {:date => "1st Jan 2009", :reminders => [{:estate_code => "0066S", :due_date => "1st Feb 2009"},
                                                     {:estate_code => "0250S", :due_date => "23rd Jan 2009"}]}
    allow(@estates).to receive(:all).and_return([
      {:estate_code => "0066S", :service_charge_period => "Quarterly", :date_array => ["1st Feb",  "3rd May",  "1st Aug",  "5th Nov"]},
      {:estate_code => "0250S", :service_charge_period => "Twice a year", :date_array => ["28th Feb", "31st May", "31st Aug", "30th Nov"]}])
    expect(@reminder.on("1st Jan 2009", @estates)).to eq(@reminder_dates)
  end


end

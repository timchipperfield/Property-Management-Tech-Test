describe Reminder do

  before(:each) do
    @new_rules = double
    allow(@new_rules).to receive(:evaluate).and_return(1)
    allow(@new_rules).to receive(:evaluate).and_return(2)
    @reminder = Reminder.new(@new_rules)

    @estates = double(:estates)
    allow(@estates).to receive(:all).and_return([
      {:estate_code => "0066S", :service_charge_period => "Quarterly", :date_array => ["1st Feb",  "3rd May",  "1st Aug",  "5th Nov"]},
      {:estate_code => "0250S", :service_charge_period => "Twice a year", :date_array => ["28th Feb", "31st May", "31st Aug", "30th Nov"]}])
  end

  it "initializes with reminder_rules" do
    expect(@reminder.rules).to eq @new_rules
  end

  it "can return estates with their reminder dates" do
    expect(@reminder).to respond_to(:on).with(2).arguments
  end

  it "returns the reminder dates for a given date and estates" do
    @expected_dates = [["0066S", "1st Feb 2009"], ["0250S", "28th Feb 2009"]]
    expect(@reminder.on("1st Jan 2009", @estates)).to eq(@expected_dates)
  end

  it "returns a message if there are no reminder dates" do
    @expected_dates = ["(no reminders)"]
    expect(@reminder.on("1st Mar 1999", @estates)).to eq(@expected_dates)
  end


end

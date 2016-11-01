require 'reminder'

describe Reminder do

  it "initializes with reminder_rules" do
    new_rules = double
    reminder = Reminder.new(new_rules)
    expect(reminder.rules).to eq new_rules
  end

end

#interation test for the unit tests

describe "features of the program" do

before do
  @example_table =
#this should be the output to the console, table must align right
  <<-EOF
+--------------+------------------------------+
| Date         | Reminders                    |
+--------------+------------------------------+
| 4th Nov 2007 | 0066S due date  5th Nov 2007 |
+--------------+------------------------------+
    EOF
  end

  it "fulfills the basic cusomer requirements" do
    @estates = Estates.new
    @estates.add("0066S", "Quarterly", ["1st Feb",  "3rd May",  "1st Aug",  "5th Nov"])
    @estates.add("0250S", "Twice a year", ["23rd Jan", "22nd Jun"])

    @reminder = Reminder.new
    expect {@reminder.on("4th Nov 2007", @estates) }.to output(@example_table).to_stdout
 end

end

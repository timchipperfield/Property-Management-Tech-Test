describe Printer do

  before do
    @printer = Printer.new
    @example_array = [["0066S", "1st Feb 2009"], ["0250S", "28th Feb 2009"]]
    @example_table =

#this should be the output to the console, table must align right
    <<-EOF
+--------------+------------------------------+
| Date         | Reminders                    |
+--------------+------------------------------+
| 1st Jan 2009 | 0066S due date  1st Feb 2009 |
|              | 0250S due date 28th Feb 2009 |
+--------------+------------------------------+
      EOF
  end


  it "outputs the array provided as a string" do
    expect { @printer.print("1st Jan 2009", @example_array) }.to output(@example_table).to_stdout
  end

end

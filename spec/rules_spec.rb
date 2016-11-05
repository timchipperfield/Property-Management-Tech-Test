describe Rules do

  before do
    @rules = Rules.new
    @estate = double
  end

  it "can take an estate with a quarterly service period and return 1 month" do
    allow(@estate).to receive(:[]).and_return "Quarterly"
    expect(@rules.evaluate(@estate)).to eq 1
  end

  it "can take an estate with a bi-yearly service period and return 2 months" do
    allow(@estate).to receive(:[]).and_return "Twice a year"
    expect(@rules.evaluate(@estate)).to eq 2
  end

  it "raises and error if the service period is invalid" do
    allow(@estate).to receive(:[]).and_return "Three times a year"
    expect{@rules.evaluate(@estate)}.to raise_error("Estate Does Not Have a valid Service Charge Period")
  end

end

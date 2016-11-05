describe Estates do

  before(:each) do
    @estates = Estates.new
    @new_estate = "0066S"
    @new_period = "Quarterly"
    @new_dates = ["1st Feb",  "3rd May",  "1st Aug",  "5th Nov"]
  end

  it "initializes with a readable array of estates" do
    expect(@estates).to respond_to(:all)
  end

  it "can add new estates" do
    @estates.add(@new_estate, @new_period, @new_dates)
    expect(@estates.all[0][:estate_code]).to eq(@new_estate)
    expect(@estates.all[0][:service_charge_period]).to eq(@new_period)
    expect(@estates.all[0][:date_array]).to eq(@new_dates)
  end
end

#estates contain an array and can add an estate this array

class Estates

attr_reader :all

  def initialize
    @all = []
  end

  def add(code, service_charge_period, date_array)
    @all << estate_to_hash(code, service_charge_period, date_array)
  end

  private

  def estate_to_hash(code, service_charge_period, date_array)
    {:estate_code => code, :service_charge_period => service_charge_period, :date_array => date_array}
  end

end

class CargoWagon
  attr_reader :type, :wagon_number
  def initialize(wagon_number)
    @type = :cargo
    @wagon_number = wagon_number
  end
end

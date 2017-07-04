require_relative 'wagon'
class CargoWagon < Wagon
  def initialize(wagon_number)
    @type = :cargo
    @wagon_number = wagon_number
  end
end

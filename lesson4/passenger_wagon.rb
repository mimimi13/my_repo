class PassengerWagon
  attr_reader :type, :wagon_number
  def initialize(wagon_number)
    @type = :parassenger
    @wagon_number = wagon_number
  end
end

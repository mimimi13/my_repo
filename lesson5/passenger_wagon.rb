require_relative 'wagon.rb'
class PassengerWagon < Wagon
  def initialize(wagon_number)
    @type = :parassenger
    @wagon_number = wagon_number
  end
end

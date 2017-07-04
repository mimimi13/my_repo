require_relative 'modules/vendor'
require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'cargo_wagon'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'passenger_wagon'
require_relative 'main_class'



run_main_class = MainClass.new


train1 = Train.new '123'
train1 = Train.new '123'
wagon1 = PassengerWagon.new 'fdfd'
train1.company_name = 'BTK'
wagon1.company_name = 'ZTR'

station1 = Station.new 'spb'

puts train1.company_name
puts wagon1.company_name
#Train.company

puts Station.get_all_station

__END__


loop do
  run_main_class.run
end

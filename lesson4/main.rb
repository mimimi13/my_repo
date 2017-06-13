require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'cargo_wagon'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'passenger_wagon'
require_relative 'main_class'



run_main_class = MainClass.new

loop do
  run_main_class.run
end

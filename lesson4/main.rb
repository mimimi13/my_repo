require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'helpers/route'
require_relative 'helpers/train'

@all_staion = []
@all_train = []
@all_route = []

def create_stantion
  puts 'введите имя станции'
  name = gets.chomp
  station = Station.new(name)
  @all_staion.push(station)
end



def all_information
  if @all_staion.any?
     puts "station list:"
     @all_staion.each do |station|
       @all_train.each do  |train|
         if station == train.station
           puts "Поезда на станции: #{station.name}"
           puts train.number
         end
       end
     end
  end
end

def print_menu
  puts '9 - exit'
  puts '1 Создавать станцию'
  puts '11 Создавать маршрут'
  puts '12 Добавить станцию в маршрут'
  puts '13 Удалить станцию из маршрута'
  puts '2 Создавать поезда'
  puts '4 Назначать маршрут поезду'
  puts '5 Добавлять вагоны к поезду'
  puts '6 Отцеплять вагоны от поезда'
  puts '7 Перемещать поезд по маршруту вперед и назад'
  puts '8 Просматривать список станций и список поездов на станции'
end

def exec_main (key)
    case key
    when 1
      puts "Создать станцию"
       create_stantion
    when 11
       puts "Создавать маршрут"
       set_route
    when 12
       puts "Добавить станцию"
       add_staion
    when 13
       puts "Удалить станцию"
       add_staion
   when 2
      puts "Создасть поезд"
      create_train
    when 3
       puts "Создавать маршруты"
       set_route
    when 4
       puts "Назначить поезду маршрут"
       set_train_route
    when 5
       puts "Добавить вагон"
       add_wagon
    when 6
       puts "удалить станцию"
       rm_wagon
     when 7
        puts "Перемещать поезд по маршруту вперед и назад"
        train_move
    else
       puts "Input Error1"
    end
end

loop do
  print_menu
  main_key = gets.chomp.to_i
  break if main_key == 9
  exec_main(main_key)
end

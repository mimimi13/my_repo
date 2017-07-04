class MainClass
  
def initialize
  @all_staion = []
  @all_train = []
  @all_route = []
end

def run
  self.print_menu
  main_key = gets.chomp.to_i
  self.exec_main(main_key)
end

def get_number_train_from_user
  puts "порядковый номер поезеда?"
  train_number = gets.chomp.to_i
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
    when 8
         puts "список станций и список поездов на станции"
         all_information
    when 9
         abort
    else
       puts "Input Error1"
    end
end

private

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

def set_train_route
  print_all_route
  print_all_train
  train_number = self.get_number_train_from_user
  puts "номер маршрута"
  train_route = gets.chomp.to_i
  @all_train[train_number].set_route(@all_route[train_route])
end

def create_train
  puts 'введите имя поезда'
  name = gets.chomp
  puts 'введите тип поезда :parassenger или :cargo'
  type = gets.chomp
  if type == :parassenger
    train = PassengerTrain.new(name)
  else
    train = CargoTrain.new(name)
  end
  @all_train.push(train)
end

def print_all_train
  puts "Список всех поездов"
  num = 0
  @all_train.each do |train|
      puts "##{num}:  number: #{train.number} type: #{train.type}"
      puts "---------------"
      num += 1
  end
end

def add_wagon
  print_all_train
  train_number = self.get_number_train_from_user
  puts "Сколько вагонов добавить?"
  train_number_wagons = gets.chomp.to_i
  wagon_number = @all_train[train_number].wagons.count.to_i + 1
  train_number_wagons.times do
    if @all_train[train_number].type == :parassenger
      wagon = PassengerWagon.new(wagon_number)
    else
      wagon = CargoWagon.new(wagon_number)
    end
      wagon_number +=1
      @all_train[train_number].add_wagons(wagon)
   end
end

def rm_wagon
  print_all_train
  train_number = self.get_number_train_from_user
  puts "Какой номер вагона удалить"
  remove_wagon_number = gets.chomp.to_i
  @all_train[train_number].wagons.each do |wagon|
      @all_train[train_number].rm_wagons(wagon) if  wagon.wagon_number == remove_wagon_number
  end

end

def move_train
  print_all_train
  train_number = self.get_number_train_from_user
  puts "перемещаем вперед - 1 или назад - 0?"
  move = gets.chomp.to_i
  if move == 0
    @all_train[train_number].prev_station
  else
    @all_train[train_number].next_station
  end
end

def print_all_route
  num = 0
  @all_route.each do |route|
      puts "##{num}: #{route.get_all_staion}"
      puts "---------------"
      num += 1
  end
end

def add_staion
  if @all_route.any?
    puts "В каком маршрут внести изменения?"
    print_all_route
    num = gets.chomp.to_i
    puts 'Номер станции которую надо добавить'
    num_station = 0
    @all_staion.each do |staion_name|
       puts "#{num_station} #{staion_name.name}"
       num_station +=1
     end
    num_station = gets.chomp.to_i
    @all_route[num].add_staion(@all_staion[num_station])
    puts "Тукущие маршруты"
    print_all_route
  else
    puts "Надо сначала создать маршрут"
  end

end

def rm_staion
  puts "В каком маршрут внести изменения?"
  print_all_route
  num = gets.chomp.to_i
  if @all_route[num].get_all_staion.count <= 2
    puts "Нельзя удалить станции из этого маршрута"
  else
    puts 'Выбирете станцию которую надо удалить'
    staion_name = gets.chomp.to_s
    @all_route[num].stantions.each do |station|
      @all_route[num].rm_staion(station) if station.name == staion_name
    end
  end
end

def set_route
  start_station = nil
  end_station = nil
  puts 'установите имя начальной станции и конечной станции'
  start = gets.chomp
  ends  = gets.chomp
  @all_staion.each do |station|
      start_station = station if station.name == start
      end_station = station if station.name == ends
  end
  if start_station.nil? || end_station.nil?
    puts "Введена несуществующая станция"
  else
    route = Route.new(start_station,end_station)
    @all_route.push(route)
  end
end
end

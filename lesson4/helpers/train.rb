def get_number_train_from_user
  puts "порядковый номер поезеда?"
  train_number = gets.chomp.to_i
end

def set_train_route
  print_all_route
  print_all_train
  train_number = get_number_train_from_user
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
  train_number = get_number_train_from_user
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
  train_number = get_number_train_from_user
  puts "Какой номер вагона удалить"
  remove_wagon_number = gets.chomp.to_i
  @all_train[train_number].wagons.each do |wagon|
      @all_train[train_number].rm_wagons(wagon) if  wagon.wagon_number == remove_wagon_number
  end

end

def move_train
  print_all_train
  train_number = get_number_train_from_user
  puts "перемещаем вперед - 1 или назад - 0?"
  move = gets.chomp.to_i
  if move == 0
    @all_train[train_number].prev_station
  else
    @all_train[train_number].next_station
  end
end

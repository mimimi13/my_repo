
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

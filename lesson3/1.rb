class Station

  attr_accessor :name
  attr_reader   :trains

  def initialize(name)
   @name = name
   @trains = []
  end

  def add_train (train)
    self.trains << train
  end

  def remove_train(train)
    self.trains.delete(train)
  end

  def get_train_by_type(type)
    self.trains.select.count { |train| train.type if train.type == type }
  end

end



class Route
  attr_accessor :stantions

  def initialize(first_station, last_station)
    self.stantions = [first_station, last_station]
  end

  def add_staion(station)
    self.stantions.insert(1, station)
  end

  def rm_staion(station)
    self.stantions.delete(station)
  end

  def get_all_staion
    self.stantions.each { |station| puts station.name }
  end

end


class Train
  attr_accessor :speed, :station, :next_station, :prev_station, :stations
  attr_reader :wagons, :type

  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons.to_i
    @speed = 0
  end

  def stop
    self.speed = 0
  end

  def add_wagons
    if self.speed == 0
      @wagons += 1
    else
      puts "The train is moving..."
    end
  end

  def rm_wagons
    if self.speed == 0 && @wagons > 1
      @wagons -= 1
    else
      puts "The train is moving or wagons =< 1 ..."
    end
  end

  def set_route(route)
    self.stations = route.stantions
    self.station = route.stantions[0]
    self.next_station = route.stantions[1]
    self.prev_station = 'none'
  end

  def current_pos(current_station)
    current = self.stations.find_index(current_station)
  end

  def move_next_station(current_station)
    if (current_pos(current_station) ==  self.stations.find_index(self.stations.last))
      puts 'final station'
    else
      self.station = self.stations[current_pos(current_station) + 1]
      self.next_station = self.stations[current_pos(current_station) + 2]
      self.prev_station = current_station
    end
  end

  def move_prev_station(current_station)
    if (current_pos(current_station) ==  self.stations.find_index(self.stations.first))
      puts 'final station'
    else
      self.station = self.stations[current_pos(current_station) - 1]
      self.next_station = self.stations[current_pos(current_station) - 2]
      self.prev_station = current_station
    end
  end

end

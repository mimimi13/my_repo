class Train
  attr_accessor :speed, :station, :next_station, :prev_station, :stations, :set_route, :type
  attr_reader :wagons, :number

  def initialize(number)
    @number = number
    @speed = 0
    @wagons = []
  end

  def stop
    self.speed = 0
  end

  def add_wagons(wagon)
    if self.speed.zero? && self.type == wagon.type
      @wagons.push(wagon)
    else
      puts "The train is moving or wrong type..."
    end
  end

  def rm_wagons
    if self.speed.zero?
      @wagons.pop
    else
      puts "The train is moving or wrong type..."
    end
  end

  def set_route(route)
    self.stations = route.stantions
    self.station = route.stantions[0]
    self.next_station = route.stantions[1]
    self.prev_station = nil
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

# только этот метод в текущей реализации вызывается внутри класса и детьми класса
  private

  def current_pos(current_station)
    current = self.stations.find_index(current_station)
  end

end

class PassengerWagon
  attr_reader :type
  def initialize
    @type = :parassenger
  end
end

class CargoWagon
  attr_reader :type
  def initialize
    @type = :cargo
  end
end

class PassengerTrain < Train
  def initialize(number)
    super
    @type = :parassenger
  end
end

class CargoTrain < Train
  def initialize(number)
    super
    @type = :cargo
  end
end

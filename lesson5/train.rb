class Train
  include Vendor
  attr_reader :wagons, :number, :speed, :stations, :next_station, :prev_station, :type, :station
  require_relative 'modules/instancecounter'
  include InstanceCounter

  @@trains = {}

  def initialize(number)
    @number = number
    @speed = 0
    @wagons = []
    @@trains[number] = self
  end

  def self.find(number)
    @@trains[number]
  end

  def stop
    self.speed = 0
  end

  def add_wagons(wagon)
    if self.speed.zero? && self.type == wagon.type
      @wagons << wagon
    else
      puts "The train is moving or wrong type..."
    end
  end

  def rm_wagons(wagon)
    if self.speed.zero?
      @wagons.delete(wagon)
    else
      puts "The train is moving or wrong type..."
    end
  end

  def set_route(route)
    @stations = route.stantions
    @station = route.stantions[0]
    @next_station = route.stantions[1]
    @prev_station = nil
  end

  def move_next_station(current_station)
    if (current_pos(current_station) ==  self.stations.find_index(self.stations.last))
      puts 'final station'
    else
      @station = @stations[current_pos(current_station) + 1]
      @next_station = @stations[current_pos(current_station) + 2]
      @prev_station = current_station
    end
  end

  def move_prev_station(current_station)
    if (current_pos(current_station) ==  self.stations.find_index(self.stations.first))
      puts 'final station'
    else
      @station = @stations[current_pos(current_station) - 1]
      @next_station = @stations[current_pos(current_station) - 2]
      @prev_station = current_station
    end
  end

# только этот метод в текущей реализации вызывается внутри класса и детьми класса
  private

  def current_pos(current_station)
    current = @stations.find_index(current_station)
  end

end

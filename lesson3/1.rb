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

  def get_train_by_type(type='cargo')
    self.trains.select.count { |train| train.type if train.type == type }
  end

end



class Route
attr_accessor :stantions

  def initialize(start_station='start',end_station='end')
    self.stantions = [start_station, end_station]
  end

  def add_staion(station_name='station_name')
    self.stantions.insert(1, station_name)
  end

  def rm_staion(station_name='station_name')
    self.stantions.delete(station_name)
  end

  def get_all_staion
    self.stantions.each { |station| puts station }
  end

end


class Train
  attr_accessor :speed, :route, :station, :next_station, :prev_station
  attr_reader :wagons, :type

  def initialize(number='12323', type='cargo', wagons=8)
    @number = number
    @type = type
    @wagons = wagons.to_i
    @speed = 0
  end

  def stop
    self.speed = 0
  end

  def add_wagons
    if (self.speed == 0)
      @wagons += 1
    else
      puts "The train is moving..."
    end
  end

  def set_route(route)
    route = route.stantions
    self.route = route
    self.station = route[1]
    self.next_station = route[2]
    self.prev_station = route[0]
  end

  def move_next_station(current_station)
    current_post = route.find_index(current_station)
    if ( current_post ==  self.route.find_index(self.route.last))
      puts 'final station'
    else
      self.station = route[current_post + 1]
      self.next_station = route[current_post + 2]
      self.prev_station = current_station
    end
  end

  def move_prev_station(current_station)
    current_post = route.find_index(current_station)
    if (current_post ==  self.route.find_index(self.route.first))
      puts 'final station'
    else
      self.station = route[current_post - 1]
      self.next_station = route[current_post - 2]
      self.prev_station = current_station
    end
  end

end

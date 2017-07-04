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

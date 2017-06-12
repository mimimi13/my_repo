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

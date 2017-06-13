load '1.rb'

# queries for debug


#Train
train = Train.new('TX-12323', 'cargo', 11)
train2 = Train.new('TX-12324', 'cargo', 8)
train3 = Train.new('TX-12325', 'passenger', 6)
train4 = Train.new('TX-12326', 'cargo', 13)
train.add_wagons
#puts train.wagons

train.speed = 33
#puts train.speed


st1 = Station.new 'Moscow'
st2 = Station.new 'SPB'
st3 = Station.new 'KIROV'


route = Route.new(st1, st2)
route.add_staion(st3)

route.get_all_staion

st1.add_train(train)
st1.add_train(train2)
st1.add_train(train3)
st1.add_train(train4)

train.set_route(route)
train2.set_route(route)
train3.set_route(route)
train4.set_route(route)
puts st1.trains
puts st1.get_train_by_type('cargo')



print  'station ', train.station
puts
print 'move_next_station ', train.move_next_station(train.station)

puts
print 'move_prev_station ', train.move_prev_station(train.station)
puts
print 'move_prev_station ', train.move_prev_station(train.station)
puts
print 'move_prev_station ', train.move_prev_station(train.station)
puts
print 'move_prev_station ', train.move_prev_station(train.station)
puts
print  'station ', train.station
puts

puts 'Station: ', train.station
puts 'PREV_station ', train.prev_station
puts 'NEXT_station ', train.next_station

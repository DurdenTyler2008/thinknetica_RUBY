
require_relative "station"
require_relative "route"
require_relative "train2"
require_relative "train_pass"
require_relative "train_cargo"

first_station = Station.new("London")
end_station = Station.new("Moscow")

train1 = Train.new(123,"pass",15)
train2 = Train.new(321,"cargo", 18)
train3 = Train.new(231,"pass", 12)

first_station.add_train(train1)
first_station.add_train(train2)
first_station.add_train(train3)

train1.show_number_cars
first_station.show_type_trains("pass")


#route = Route.new(first_station, end_station)
#route.add_station("Paris")
#route.add_station("Madrid")
#route.show_stations

#train1.accept_route(route)
#train1.previous_station
#train1.next_station
#train1.moving_forvard
#train1.moving_backward

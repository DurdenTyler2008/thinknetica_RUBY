=begin
Класс Train (Поезд):
Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса
Может набирать скорость
Может возвращать текущую скорость
Может тормозить (сбрасывать скорость до нуля)
Может возвращать количество вагонов
Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). Прицепка/отцепка вагонов 
может осуществляться только если поезд не движется.
Может принимать маршрут следования (объект класса Route). 
При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
=end

class Train
  attr_accessor :train, :type, :number_cars, :speed, :route, :current_station 
  

  def initialize (train, type, number_cars)
    @train = train
    @type = type
    @number_cars = number_cars
    @speed = 0
    @route = route
    @current_station = nil
  
  end

  def speed=(speed) # набирает скорость(метод сеттер train.speed=100)
    @speed = speed
  end

  def show_speed # возвращает скорость
    puts "Теущая скорость: #{@speed}"
  end

  def brake_speed # тормозит, сбрасывает скорость до 0
    @speed = 0
    puts "Поезд стоит"
  end

  def show_number_cars # возвращает количество вагонов
    puts "Поезд имеет #{@number_cars} вагонов"
  end

  def add_car # прицепляет 1 вагон
    @number_cars += 1 if @speed == 0
  end

  def send_car # отцепляет 1 вагон
    @number_cars -= 1 if @speed == 0
  end

  def accept_route(route)
    @real_route = route # принимает маршрут следования (объект класса Route)
    @current_station = route.first_station # При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте
  end

  def moving # движение вперед и назад
    if @current_station != @real_route.end_station
      current_station = @real_route.stations.index(@current_station) + 1
    elsif @current_station != @real_route.first_station
      current_station = @real_route.stations(@current_station) - 1 
    elsif @current_station == @real_route.end_station
      puts "Вы в конце пути"
    else
      puts "Error"  
    end
  end

  def show_stations
    previous_station = @real_route.stations.index(@current_station) - 1
    #puts "Предидущая станция: #{previous_station}"
    puts "Предидущая станция: #{@real_route.stations[previous_station]}"

    next_station = @real_route.stations.index(@current_station) + 1
    puts "Следующая станция: #{@real_route.stations[next_station]}"

    current_station = @real_route.stations.index(@current_station)
    puts "Текущая станция: #{@real_route.stations[current_station]}"
  end
end

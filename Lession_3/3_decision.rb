=begin
Требуется написать следующие классы:

Класс Station (Станция):
Имеет название, которое указывается при ее создании
Может принимать поезда (по одному за раз)
Может возвращать список всех поездов на станции, находящиеся в текущий момент
Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).

Класс Route (Маршрут):
Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а 
промежуточные могут добавляться между ними.
Может добавлять промежуточную станцию в список
Может удалять промежуточную станцию из списка
Может выводить список всех станций по-порядку от начальной до конечной

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

class Station
  attr_accessor :trains
  
  def initialize(name)
    @name = name
    @trains = []
  end
  
  def add_train(train) # принимает поезда 
    @trains << train
  end

  def show_trains # возвращает список всех поездов на станции, находящиеся в текущий момент
    @trains.each {|train| puts "поезд на станции: #{train}"}
  end

  def show_type_trains(type) # возвращает  список поездов на станции по типу
    @trains.select { |train| train.type == type }
  end

  def send_train(train) # отправляет поезд и удаляет его из списка
    if trains.any?
      @trains.delete(train)
      puts "Поезд #{train} отправляется"
    else
        puts "На станции нет поездов"  
    end
  end
end

class Route
  attr_accessor :stations
  attr_reader :first_station, :end_station

  def initialize(first_station, end_station)
    @first_station = first_station
    @end_station = end_station
    @stations = [first_station, end_station]
  end
  
  def add_station(station) # добавляет станцию
    @stations.insert(-2, station)
  end

  def send_station(station) # удаляет станцию
    if station != @first_station && station != @end_station
       @stations.delete(station)
    else
        puts "Эта станция не может быть удaлена!" 
    end
  end

  def show_stations # выводит список станций
    @stations.each {|station| puts " Список станций: #{station}"} 
  end
end

class Train
  attr_accessor :train, :type, :number_cars, :speed, :route, :current_station 
  
  def initialize (train, type, number_cars)
    @train = train
    @type = type
    @number_cars = number_cars
    @speed = 0
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
    if @number_cars == 0
      puts "У поезда нет вагонов"
    else
      @number_cars -= 1 if @speed == 0
    end
  end

  def accept_route(route)
    @route = route # принимает маршрут следования (объект класса Route)
    @current_station = route.first_station # При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте
  end

  def current_station_index # возвращает индекс текущей станции
    @route.stations.index(@current_station) 
  end

  def next_station # возвращает объект следующей станци
    @route.stations[current_station_index + 1]
  end

  def previous_station # возвращает объект предидущей станции
    @route.stations[current_station_index - 1]
  end


  def moving_forvard
    if @current_station != @route.end_station
      @current_station = next_station
      puts "Вы на станции: #{next_station}" 
    else
      puts "Вы на последней станции"
    end
  end

  def moving_backward
    if @current_station != @route.first_station
      @current_station = previous_station
      puts "Вы на станции: #{previous_station}"
    else
      puts "Вы на первой станции"
    end
  end

end

  
  



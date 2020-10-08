class Train
  attr_accessor :train, :type, :number_cars, :speed, :route, :current_station 
    
  def initialize (train, type, number_cars)
    @train = train
    @type = type
    @number_cars = []
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
    puts "Поезд #{@train} имеет #{@number_cars} вагонов"
  end
  
  def accept_route(route)
    @route = route # принимает маршрут следования (объект класса Route)
    @current_station = route.first_station # При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте
  end
  
  def current_station_index # возвращает индекс текущей станции
    @route.stations.index(@current_station) 
  end
  
  def next_station # возвращает объект следующей станци
    puts "следующая станция: #{@route.stations[current_station_index + 1]}"
  end
  
  def previous_station # возвращает объект предидущей станции
    puts "предидущая станция: #{@route.stations[current_station_index - 1]}"
  end
  
  
  def moving_forvard
    if @current_station != @route.end_station
      @current_station.send_train(self)
      @current_station = next_station
      #@current_station.add_train(self) #- не работает,не определен метод для nil
        
    else
      puts "Вы на последней станции"
    end
  end
  
  def moving_backward
    if @current_station != @route.first_station
      @current_station.send_train(self)
      @current_station = previous_station
      @current_station.add_train(self)
    else
      puts "Вы на первой станции"
    end
  end

  protected #доступен в подклассах.Прицепляет и отцепляет вагоны 2х типов

  def add_car(number_cars) # прицепляет number_cars вагонов
    if @speed != 0
      puts "Поезд едет, присоединение вагонов не возможно"
    elsif 
      @type != number_cars.type
      puts "тип поезда и тип вагона не совпадают"
    else
      @number_cars << number_cars
    end
  end
  
  def send_car # отцепляет 1 вагон
    if @number_cars == 0
      puts "У поезда нет вагонов"
    else
      @number_cars -= 1 if @speed == 0
    end
  end
end

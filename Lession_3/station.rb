=begin
Требуется написать следующие классы:
Класс Station (Станция):
Имеет название, которое указывается при ее создании
Может принимать поезда (по одному за раз)
Может возвращать список всех поездов на станции, находящиеся в текущий момент
Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
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

class Station
  attr_accessor :trains
    
  def initialize(name)
    @name = name
    @trains = []
  end
    
  def add_train(train) # принимает поезда 
    @trains << train
    puts "На станцию #{@name} прибыл поезд #{train}"
  end
  
  def show_trains # возвращает список всех поездов на станции, находящиеся в текущий момент
    @trains.each {|train| puts "поезд на станции: #{train}"}
  end
  
  def show_type_trains(type) # возвращает  список поездов на станции по типу
    @trains.select { |train| train.type == type }
    #puts "на станции #{@name} поезда типа #{type}: #{@trains.select}"
  end
  
  private # т.к. работает только в этом классе, отправлять и удалять может только одна(приватная) станция и нет наследования

  def send_train(train) # отправляет поезд и удаляет его из списка
    if trains.any?
      @trains.delete(train)
      puts "Поезд #{train} отправляется"
    else
        puts "На станции нет поездов"  
    end
  end
end

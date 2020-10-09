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
  
  private # работает только в этом классе,нет наследования

  def show_stations # выводит список станций
    @stations.each {|station| puts " Список станций: #{station}"} 
  end
end

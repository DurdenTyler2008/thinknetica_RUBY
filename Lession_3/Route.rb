=begin
Класс Route (Маршрут):
Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а 
промежуточные могут добавляться между ними.
Может добавлять промежуточную станцию в список
Может удалять промежуточную станцию из списка
Может выводить список всех станций по-порядку от начальной до конечной
=end

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

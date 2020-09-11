=begin
Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя). 
Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным. 
(Запрещено использовать встроенные в ruby методы для этого вроде Date#yday или Date#leap?)  
=end

puts "Введите число"
number = gets.chomp.to_i

puts "Введите месяц"
month = gets.chomp.to_i

puts "Введите год"
year = gets.chomp.to_i

days_in_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

if  year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)
  days_in_month[1] = 29
end

arr_month = days_in_month.slice(0...month-1) # slice создает новый массив месяцев до введенного месяца пользователем
answer = arr_month.reduce{|result, current| result += current} + number # reduce получает сумму значений этого массива
puts "Порядковый номер даты: #{answer}" 

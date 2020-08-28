=begin
Прямоугольный треугольник. Программа запрашивает у пользователя 3 стороны треугольника и определяет, является ли 
треугольник прямоугольным (используя теорему Пифагора www-formula.ru), равнобедренным (т.е. у него равны любые 2 стороны)  
или равносторонним (все 3 стороны равны) и выводит результат на экран. Подсказка: чтобы воспользоваться теоремой Пифагора, 
нужно сначала найти самую длинную сторону (гипотенуза) и сравнить ее значение в квадрате с суммой квадратов двух остальных 
торон. Если все 3 стороны равны, то треугольник равнобедренный и равносторонний, но не прямоугольный.
=end

puts "Введите 1ю сторону треугольника:"
a = gets.chomp.to_f

puts "Введите 2ю сторону треугольника:"
b = gets.chomp.to_f

puts "Введите 3ю сторону треугольника:"
c = gets.chomp.to_f

array_input = [a,b,c]
array_sort = array_input.sort
hypotenuse = array_sort[2]
side1 = array_sort[0]
side2 = array_sort[1]

if hypotenuse**2 == side1**2 + side2**2
  puts "Этот треугольник прямоугольный"
elsif hypotenuse == side1 && hypotenuse == side2 && side1 == side2
  puts "Этот треугольник равнобедренный и равносторонний"  
elsif side1 == side2
  puts "Этот треугольник равносторонний"  
else
  puts "Этот треугольник обычный"   
end
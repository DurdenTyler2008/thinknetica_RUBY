=begin
Сумма покупок. Пользователь вводит поочередно название товара, цену за единицу и кол-во купленного товара 
(может быть нецелым числом). Пользователь может ввести произвольное кол-во товаров до тех пор, пока не введет "стоп" 
в качестве названия товара. На основе введенных данных требуетеся:
Заполнить и вывести на экран хеш, ключами которого являются названия товаров, а значением - вложенный хеш, 
содержащий цену за единицу товара и кол-во купленного товара. Также вывести итоговую сумму за каждый товар.
Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".   
=end

final_hash = Hash.new

loop do

  puts "Введите название товара или stop:"
  purchase_name = gets.chomp
  break if purchase_name == "stop"

  puts "Введите цену за единицу:"
  purchase_price = gets.chomp.to_f

  puts "Введите кол-во купленного товара:"
  purchase_quantity = gets.chomp.to_f

  if final_hash[purchase_name].nil?
    final_hash[purchase_name] = { purchase_price: purchase_price, purchase_quantity: purchase_quantity }
  else
    puts "Error"
  end 
end

final_hash.each {|key, value| puts "#{key} на сумму: #{value[:purchase_price] * value[:purchase_quantity]}"}

purchase_amount = 0 # итоговая сумма покупки
final_hash.each_value { |value| purchase_amount += value[:purchase_price] * value[:purchase_quantity] }

puts "Итоговый хеш: #{final_hash.to_s}"
puts "Итоговая сумма покупки: #{purchase_amount}"

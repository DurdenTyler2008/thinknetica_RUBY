=begin
Заполнить массив числами от 10 до 100 с шагом 5 
=end

#arr = (10..100).map {|i| i+5}
#puts arr 
# map создал новый массив

arr = [] 
i = 10

until i >= 100 # while i <= 100 
  puts i
  i += 5 
end

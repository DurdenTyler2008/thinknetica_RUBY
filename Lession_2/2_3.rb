=begin
заполнить массив числами Фибоначчи до 100
=end

arr = [0, 1]

while (arr[-1] < 100) && (arr[-1] + arr[-2] <= 100) do 
  arr.push(arr[-1] + arr[-2]) 
end
print "Числа Фибоначчи до 100:", arr

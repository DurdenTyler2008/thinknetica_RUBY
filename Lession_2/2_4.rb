=begin
Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).  
=end

arr = (:a..:z).to_a
arr_vowels = [:a, :e, :i, :o, :u, :y]

arr.each.with_index(1) do |letter, index|
  puts "#{letter} => #{index}" if arr_vowels.include?(letter) # include? проверяет вхождение, возвращает true
end

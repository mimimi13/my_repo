=begin
1. Сделать хеш, содеращий месяцы и количество дней в месяце.
В цикле выводить те месяцы, у которых количество дней ровно 30
2. Заполнить массив числами от 10 до 100 с шагом 5
3. Заполнить массив числами фибоначчи до 100
4. Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

=end


vowels = %w( a e i o u )
abc=('a'..'z')

vowels_hash = {}
abc.each_with_index() do  |letter, index|
      if vowels.include?(letter)
        vowels_hash[letter] = index + 1
      end
end

puts vowels_hash

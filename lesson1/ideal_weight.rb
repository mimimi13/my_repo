puts "Укажите ваше имя и рост"
name = gets.chomp
growth = gets.chomp.to_i
if growth < 110
  puts "Ваш вес уже оптимальный"
else
  puts "#{name}, твой идеальный вес #{growth - 110}"
end

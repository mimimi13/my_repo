puts "Укажите ваше имя и рост"
Name = gets.chomp
Growth = gets.chomp
if Growth.to_i < 110
  puts "Ваш вес уже оптимальный"
else
  puts "#{Name}, твой идеальный вес #{Growth.to_i-110}"
end

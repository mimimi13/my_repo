puts "Укажите длинны трех сторон треугольника"
a = gets.chomp.to_f
b = gets.chomp.to_f
c = gets.chomp.to_f
sorted_values = [a,b,c].sort!

if (sorted_values[0] == sorted_values[1]) && (sorted_values[0] ==sorted_values[2])
  puts "Треугольник равносторонний" 
elsif (sorted_values[0] == sorted_values[1] || sorted_values[2] == sorted_values[0] || sorted_values[2] == sorted_values[1])
  puts "Треугольник равнобедренный" 
end
puts "Треугольник прямоугольный" if (sorted_values[2] ** 2) == (sorted_values[0] ** 2 + sorted_values[1] ** 2)

puts "Укажите длинны трех сторон треугольника"
a = gets.chomp.to_i
b = gets.chomp.to_i
c = gets.chomp.to_i
if a==b || b==c || a==c
  puts "Треугольник равносторонний"
elsif a**2 == b**2 + c**2
  puts "Треугольник прямоугольный"
elsif b**2 == a**2 + c**2
  puts "Треугольник прямоугольный"
elsif c**2 == a**2 + b**2
   puts "Треугольник прямоугольный"
else
   puts "Треугольник непонятный"
end

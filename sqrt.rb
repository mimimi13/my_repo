puts "Введите три коэффициента"
a = gets.chomp.to_f
b = gets.chomp.to_f
c = gets.chomp.to_f
D = b ** 2 - 4 * a * c
if D < 0
  puts "Корней нет"
elsif D > 0
  x1 = ((-b) + Math.sqrt(D)) / (2 * a)
  x2 = ((-b) - Math.sqrt(D)) / (2 * a)
  puts "D = #{D}; Х1 = #{x1}; Х2 = #{x2}"
else
  x =  (-b) / (2 * a)
  puts "D = 0; X1 = X2 = #{x}"
end

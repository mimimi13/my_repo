puts "Введите три коэффициента"
a = gets.chomp.to_f
b = gets.chomp.to_f
c = gets.chomp.to_f
d = b ** 2 - 4 * a * c
if d < 0
  puts "Корней нет"
elsif d > 0
  d_sqrt = Math.sqrt(d)
  x1 = ((-b) + d_sqrt) / (2 * a)
  x2 = ((-b) - d_sqrt) / (2 * a)
  puts "d = #{d}; Х1 = #{x1}; Х2 = #{x2}"
else
  x =  (-b) / (2 * a)
  puts "d = 0; X1 = X2 = #{x}"
end

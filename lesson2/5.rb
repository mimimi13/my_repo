=begin
5. Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя).
Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным.
(Запрещено использовать встроенные в ruby методы для этого вроде Date#yday или Date#leap?)
Алгоритм опредления високосного года: www.adm.yar.ru

=end
m = %w(
        31
        28
        31
        30
        31
        30
        31
        31
        30
        31
        30
        31
      )

puts "Введите день, месяц и год"
day = gets.chomp.to_i
month = gets.chomp.to_i
year = gets.chomp.to_i

=begin testing values
      day=29
      month=4
      year=2016
      sum_day=0
=end

sum_day=0

if (month < 1) || (month > 12) || (year < 1) || (day < 1) || (day > 31)
  puts "ERROR values"
end

def leap_year(year)
  ((year % 4 == 0) && (year % 100 != 0)) || ((year % 100 == 0) && (year % 400 == 0))
end

m.each.with_index do |mas_value,index|
  if (index < month - 1 )
    sum_day += mas_value.to_i
  end
  if (index == month - 1 )
      sum_day += day
      sum_day += 1 if ((month > 1) && (day > 28) && leap_year(year))
    end
end
puts "totol days is #{sum_day}"

=begin
5. Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя).
Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным.
(Запрещено использовать встроенные в ruby методы для этого вроде Date#yday или Date#leap?)
Алгоритм опредления високосного года: www.adm.yar.ru

=end
m = {"January"=>31, "February"=>28, "March"=>31, "April"=>30, "May"=>31, "June"=>30, "July"=>31, "August"=>31, "September"=>30, "October"=>31, "November"=>30, "December"=>31}

day=2
month=12
year=1986
sum_day=0

if (month < 1) || (month > 12) || (year < 1) || (day < 1) || (day > 31)
  puts "ERROR values"
end




def leap_year(year)
  if ((year % 4 == 0) && (year % 100 != 0)) || ((year % 100 == 0) && (year % 400 == 0))
    puts "год високосный"
    return true
  end
    puts "год НЕ високосный"
    return false
end

m.each.with_index do |mas_value,index|
  if (index < month - 1 )
    sum_day += mas_value[1]
  end
  if index == month
    sum_day += day
    sum_day += 1 if leap_year(year)
  end
end
puts "totol days is #{sum_day}"

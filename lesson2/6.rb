=begin
6. Сумма покупок.
 Пользователь вводит поочередно название товара, цену за единицу и кол-во купленного товара (может быть нецелым числом).
 Пользователь может ввести произвольное кол-во товаров до тех пор, пока не введет "стоп" в качестве названия товара.
 На основе введенных данных требуетеся:
Заполнить и вывести на экран хеш, ключами которого являются названия товаров, а значением - вложенный хеш, содержащий цену за единицу товара и кол-во купленного товара.
Также вывести итоговую сумму за каждый товар.
Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".
=end

products = {}
total_sum = 0

loop do
  puts "product"
  product_name = gets.chomp
  break if product_name == 'стоп'
  puts "price"
  product_price = gets.chomp.to_f
  puts "quantity"
  product_quantity = gets.chomp.to_f
  products[product_name] = {'price' => product_price, 'quantity' => product_quantity}
end

puts products

products.each do |name,property|
   sum = property['price'] * property['quantity']
   puts "#{name} total:  #{sum}"
   total_sum +=sum
 end
 puts "Сумма всех покупок: #{total_sum}"

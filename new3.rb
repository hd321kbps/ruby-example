# Циклы
i = 5
# until выполняеться пока не станет false или nil
until i == 0
  puts "На число #{i} можно делить"
  i -= 1
end

# Цикл, как модификатор
# begin если несколько строчек
a = 1
begin
  puts "iteration # #{a}"
  a += 1
end while a <= 10

a = 0
a += 1 while a < 89
puts a

# Цикл for с диапазоном 
for n in 5..10
  puts n
end

# Цикл loop
n1 = 0
loop do
  n1 += 1
  if n1 == 5
    # Пропустить итерацию
    next
  end
  puts "#{n1}"
  if n1 == 13
    # Выход из итерации
    break
  end
end

# Итераторы
arr = [1, 2, 3, 4, 5]
arr.each do |j|
  puts j * 5
end

puts "Какое количетво раз повторить действие?"
m = gets.to_i
m.times do
  puts "Выполнено #{m} раз"
end

# Разница
3.upto(9) {|o| puts o}
5.times{|o| puts o}

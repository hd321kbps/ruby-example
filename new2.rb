puts hash = Hash[1,2,3,4,5,6] #=> {1=>2, 3=>4, 5=>6}
puts hash = Hash[:a,1,:b,2,:array,[3,4,5,6]] #=> {:a=>1, :b=>2, :array=>[3,4,5,6]}
puts hash = Hash[[[:a,:b,:c,:d],[3,4,5,6]].transpose] #=> {:a=>3, :b=>4, :c=>5, :d=>6}

h = {a: 100, b: 200, c:300}
puts h.invert #=> {100=>:a, 200=>:b, 300=>:c}

puts hash.to_a #=> [[1,2], [3,4]]
puts h.merge(Hash[1,2,3,4,5,6])
puts h.inspect

# Ветвления
x = gets.to_f
y = x + 3 - x * 3

if y > 10
  puts "Функция y принимает значение больше 10 в данной точке"
end
# С новой строки или then
if 2+2==4 then puts "Все верно!"
end
# elseif слитно
# Однострочные ветвления, как модификатор
x = 0
x += 1 if x.zero?
puts x
# Ветвление unless работает только с boolean срабатывает с false, а не с true, как в if

puts "Дни недели"
puts "Введите номер от 1 до 7"

count = gets.to_i

case count
  when 1
    puts "Понедельник"
  when 2
    puts "Вторник"
  when 3
    puts "Среда"
  when 4
    puts "Четверг"
  when 5
    puts "Пятница"
  when 6
    puts "Суббота"
  when 7
    puts "Воскресенье"
  # По дефолту
  else
    puts "Вы ввели неправильный номер"
end
# Case можно присваивать в переменную
#!/usr/bin/ruby
# -*- coding: utf-8 -*-
def myfunc a, &b
  puts "Start #{a}"
  b.call 12,23
  puts "End #{a}"
end

# Передали блок в функцию с параметрами
myfunc :first do |x,y|
  puts "x = #{x}"
  puts "y = #{y}"
end

# Блок, анонимная функция
func = lambda { |a,b| a+b*b }
puts func.call(1,2)

# Цыкл
def fibo n
  # Параллельное присваивание
  a, b = 1, 1
  # yield a
  # while n > 1
  #2 while n > 0
  # функция для подсчета
  n.times do
    yield b
    a, b = b, a+b
    #2 n -= 1
  end
end

fibo 10 do |num|
  # Четные
  next unless num % 2 == 0
  puts num
  # Разрыв функции break
  # Повторить туже самую итерацию redo
  # Следующиe итерации next
end

# Цыкл бесконечный
def fibo1
  # Параллельное присваивание
  a, b = 1, 1
  # yield a
  # while n > 1
  #2 while n > 0
  # функция для подсчета
  loop do
    yield b
    a, b = b, a+b
    #2 n -= 1
  end
end

fibo1 do |num|
  # Ограничение
  break if num > 100
  puts num
end

# Список
l = [ 'one', 'two', :three]
# Функция перебора элементов списка
l.each do |el|
  puts el
end
# Альтернативная функция for in
for el in l
  puts el
end

# Словарь
dist = { one: 1, two: 2, three: 3 }
dist.each do |key,value|
  puts "#{key}: #{value}"
end

# Перебор диапазона
# Создает список [1..5].each do |k|
# НЕ создает диапозон в живую
5.upto(10) do |k|
  puts k
end

# Считивание содержимого файла построчно
File.open('top.rb', 'rt').each do |line|
  puts line
end

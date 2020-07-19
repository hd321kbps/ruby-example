#!/usr/bin/ruby
# -*- coding: utf-8 -*-

def test( a, b, c)
  puts "a = #{a}, b = #{b}, c = #{c}"
end

test 1, 2, 3

l = [ 10, 20 ]
test 50, *l
test *l, 50

# В other попадут все остальные параметры
def test1 a, b, *other
  puts "a = #{a}, b = #{b}, other = #{other}"
end

test1 'V', 10, 20, 40, true

# Преобразует в строку
puts l.to_s

def test2 a, other
  puts "#{a} #{other}"
end
# Новый синтаксис
test2 'Hello', { one: 'One', two: 'Two'}
# Старый синтаксис
test2 'world!', { :one => 'One', :two => 'Two'}
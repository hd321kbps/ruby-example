#!/usr/bin/ruby
# -*- coding: utf-8 -*-

require_relative 'brick'

# Создание экземпляра
b = Brick.new( 10, 20, 30 )
puts b.volume
# b.volume = 50.0
puts b.volume
# puts "#{b.len}x#{b.width}x#{b.height}"
puts b

# Достройка класса
class Brick
  def twice!
    x = Math.cbrt(2)
    @len *= x
    @width *= x
    @height *= x
  end
end

b1 = Brick.new( 1, 2, 3 )
puts b
puts b1
puts '-----'
b.twice!
b1.twice!
puts b
puts b1

# Добавляем функцию в класс
class Array
  def noeven!
    0.upto(size-1) do |k|
      self[k] = nil if self[k] % 2 == 0
    end
  end
end

s = [ 1, 2, 3 , 4, 5, 6, 7 ]
s.noeven!
puts s.to_s


# Добавление метода
text = 'Pupkin Vasya'
mytext = 'Vasya Pupkin'
def mytext.spaces
  result = 0
  each_char do |t|
    result += 1 if t == ' '
  end
  return result
end

# puts mytext.spaces
# puts text.spaces

# puts Brick.count
# puts b.count
# puts b1.count

puts '====='
puts b1.volume
b1.len = 123
puts b1.volume

# Наследование
class BeautifulBrick < Brick
  attr_accessor :color
end

# Примесь
module Enumerate
  def enum
    k = 0
    each do |t|
      yield k, t
      k += 1
    end
  end
end

class Array
  include Enumerate
end

[100, 200, 300, 400].enum do |k,t|
  puts "#{k}: #{t}"
end 
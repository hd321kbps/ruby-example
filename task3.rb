#!/usr/bin/ruby
# -*- coding: utf-8 -*-

def ok? n
  return n % 2 == 0
end

[1, 2, 4, 6, 7].each do |n|
  puts ok?(n)
end

def warn!
  $x += 1
end

class X
  def host= x
    puts '___'
    puts x
    puts '___'
  end
end

# Вызов и создание экземпляра класса
y = X.new
y.host= 25
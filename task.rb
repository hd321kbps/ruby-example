#!/usr/bin/ruby
# -*- coding: utf-8 -*-
def sqrt_int( n )
  x = 0
  n.times do |k|
    x += 2*k+1
    return k if x > n
  end
end

0.upto(25) do |k|
  puts "#{k} -> #{sqrt_int(k)}"
end
#!/usr/bin/ruby
# -*- coding: utf-8 -*-

require_relative 'top'

puts 'Hello'

print 'a: '; a = Float( gets )
print 'b: '; b = gets.to_f

puts TOP.tops( a,b )
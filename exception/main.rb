require_relative 'line'
require_relative 'polygone'

l1 = Line.new( '0.0+1.0i', '1.0+0.0i' )
l2 = Line.new( 0.0, '1.0+1.0i' )
l3 = Line.new( '0.0+3.0i', '1.0+4.0i' )

# puts l1.intersect l2
puts l1 & l2
# puts l1.intersect l3
puts l1.intersects? l3

puts '-----'

p = Polygone.new(0.0, '0.0+2i', '2+2i', '2+0i' )
a1 = Complex( '1+1i' )
a2 = Complex( '10+1i' )

puts p.outer? a1
puts p.outer? a2
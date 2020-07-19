require 'fiber'

text = 'hggggf55 hggg, 2134 ase, jyfnj fn hgg'

# Выбираем только числа
numbers = Fiber.new do
  text.scan( /\d+/ ) do |t|
    Fiber.yield Integer(t)
  end
end

# puts numbers.resume
# puts numbers.resume

fib = Fiber.new do |t|
  a, b = 1, 1
  loop do
    Fiber.yield a
    # require подключить модуль
    puts Fiber::current
    a, b = b, a+b
  end
end

10.times { puts fib.resume }
puts '-----'
while( a = fib.resume ) < 100 do
  puts a
end

class Fib < Fiber
  attr_accessor :a, :b

  def initialize
    super do
      fib = Fiber::current
      loop do
        r = fib.a
        fib.a, fib.b = fib.b, fib.a+fib.b
        Fiber.yield r
      end
    end
    @a = 1
    @b = 1
  end

  # Сброс последовательности
  def reset
    @a, @b = 1, 1
  end
end

puts '-----'

f1 = Fib.new
10.times { puts f1.resume }
f1.reset
puts '-----'
10.times { puts f1.resume }

block = Proc.new do
  puts 'vlock'
end

def func
  puts 'func'
end
f = Proc.new { func }
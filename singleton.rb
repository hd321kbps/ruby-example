# Метод Синглтон
class Foo
end

foo = Foo.new
bar = Foo.new

def foo.hello
  puts "Hi"
end

foo.hello
# метода bar не определен
bar.hello 
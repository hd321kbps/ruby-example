# Ruby 1.9
class Test
  def initialize sym, &block
    @sym = sym
    @block = block
    @count = 0
    run
  end

  def run
    # Запуск блока
    # @block.call @count, @sym

    # Запуск блока в определенном потоке
    @thread = Thread.new @count, @sym do |count, sym|
      @block.call count, sym
    end
    @count += 1
  end

  def value
    result = @thread.value
    run
    return result
  end
end

t = Test.new( :test ) do |count,sym|
  "#{count} #{sym}"
end

10.times do
  puts t.value
end
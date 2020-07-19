#!/usr/bin/ruby
# -*- coding: utf-8 -*-

# Процесс Фернхюльста
def fern delta, x=0.5
  k = 0
  loop do
    yield k, x
    x += x*(1.0-x)*delta
    k += 1
  end
end

# Запись в файл
# trg = File.open( 'data.txt', 'wt')
# fern(0.5) do |k, x|
#   trg.puts "#{k}: #{x}"
#   # Количество значений
#   break if k > 1000
# end
# trg.close

# Автоматическое закрытие файла
# После параметров переменные после ;
x = 'Вася'
File.open( 'data.txt', 'wt') do |trg; x|
  x = 12
  fern(0.5) do |k, x|
    trg.puts "#{k}: #{x}"
    # Количество значений
    break if k > 10
  end
  # puts x равно 12
end
# puts x равно 12
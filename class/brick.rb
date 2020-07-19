#!/usr/bin/ruby
# -*- coding: utf-8 -*-

require_relative 'vol'

class Brick

  include Vol

  @@count = 0
  # Конструктор
  def initialize( len, width, height )
    @data = nil
    @len = len
    @width = width
    @height = height
  end
  
  # def self.count
  #   @@count
  # end

  def valid?
    @len=0 && @width>0 && @height>0
  end

  # Можно не писать self (def part self, quant)
  def part quant
    # Переменная экземпляра @len
    # Переменная класса @@count
    l1 = @len*quant
    @len -= l1
    return Brick.new( l1, @width, @height )
  end

  def height
    @height
  end
  def height= value
    @height = value
    update
  end

  # Встроеный метод для создание методов
  # setter
  attr_reader :width
  # def width= value
  #   @width = value
  # end
  # getter
  attr_writer :width

  # Setter и Getter
  attr_accessor :len

  # Getter свойство
  # def volume
  #   @len * @width * @height
  # end
  # # Setter
  # def volume= value
  #   @len = Math.cbrt( value )
  #   @width = @len
  #   @height = @len
  # end

  def to_s
    # super функция с параметрами
    result = super
    result + sprintf( ': %.3fx%.3fx%.3f', @len, @height, @width )
  end
end

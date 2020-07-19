#!/usr/bin/ruby
# -*- coding: utf-8 -*-

module Vol
  # Функция примеси
  def volume
    @volume = @len*@width*@height if @volume == nil
    @volume
  end

  def update
    # null
    @volume = nil
  end
end
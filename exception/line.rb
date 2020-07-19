class NoIntersection < Exception
end

class Line

  attr_reader :a, :b

  def initialize a, b
    # Конвертация в комплексное число
    @a = Complex( a )
    @b = Complex( b )
  end

  def step
    @b - @a
  end

  def z(t)
    raise RangeError, 'Parameter out of range' if t < 0.0 || t > 1.0
    @a*(1.0-t) + @b*t
  end

  # def intersect other
  def & other
  begin
      ba1 = step
      ba2 = other.step
      a21 = other.a - @a
      # delta = ba1.real*ba2.imag + ba1.imag*ba2.real
      delta = (ba1*ba2.conj).imag
      raise NoIntersection if delta == 0.0
      delta_t = (a21*ba2.conj).imag
      delta_u = (a21*ba1.conj).imag
      t = delta_t / delta
      u = delta_u / delta
      other.z(u)
      z(t)
    # Подмена исключения
    rescue RangeError
      raise NoIntersection
    end
  end

  def intersects? other
    begin
      # intersect other
      self & other
    rescue NoIntersection
      false
    else
      true
    end
  end

end
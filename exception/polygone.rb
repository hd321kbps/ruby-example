class NoVertexes < Exception
end

class Polygone

  def initialize *vertexes
    # if vertexes.size == 0
    # else
    #   if vertexes.size == 1
    #   else
    #   end
    # end
    case vertexes.size
      when 0 then
        raise NoVertexes
      when 1 then
        vertexes = vertexes[0]
      # else        
    end
    
    @vert = []

    vertexes.each do |v|
      @vert << Complex(v)
    end

    def each_vert
      @vert.each do |v|
        yield v
      end
    end

    def size
      @vert.size
    end

    # Перегрузка операций
    def [] k
      @vert[k]
    end

    def external_point
      x = self[0].real
      y = self[0].imag
      each_vert do |v|
        x = v.real if v.real > x
        y = v.imag if v.imag > y
      end
      # return Complex( x, y+1.0 )
      return Complex( x+2.0, y+2.0 )
    end

    def external_points count
      ext = external_point
      count.times do
        t = Random.rand * 2.0 * Math::PI
        yield ext + Complex.polar( 1.0, t )
      end
    end

    def each_edge
      # 0.upto(@vert.size-2) do |k|
      #   yield Line.new( @vert[k], @vert[k+1] )
      # end
      # yield Line.new( @vert[-1], @vert[0] ) 
      0.upto(@vert.size-1) do |k|
        yield Line.new( @vert[k-1], @vert[k] )
      end
    end

    def outer? point
      r = { true => 0, false => 0 }
      external_points(5) do |ext|
        line = Line.new( point, ext )
        # k = 0
        # edges.each do |e|
        #   k += 1 if line.intersects? e
        # end
        # k % 2 == 0
        result = true
        each_edge do |e|
          # result = "#{e.a}--#{a.b} #{line.intersects? e}"
          result = !result if line.intersects? e
        end
        r[result] += 1
      end
      return r[true] > r[false]
    end

    def each_triangle
      ext = external_point
      each_edge do |e|
        yield Polygone.new( ext, e.a, e.b )
      end
    end

    def area_small 
      if @vert.size == 3 then
        ba = @vert[1]-@vert[0]
        ca = @vert[2]-@vert[0]
        return 0.5 * ( ba * ca.conj ).imag
      end
    end

  end

end
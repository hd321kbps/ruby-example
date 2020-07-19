class Human
  # Protected
  def fun_hi
    self.hi
  end

  protected
  def hi
    puts "hi"
  end
  
  # Private
  def fun_hi2
    self.hi2
  end

  private
  def hi2
    puts "hi2"
  end
  
end

h = Human.new
h.fun_hi
# h.hi

h2 = Human.new
# h2.fun_hi2
# h2.hi2
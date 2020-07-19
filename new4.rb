# передает массив
def do_collection(m,*string)
  result = []
  string.each{|str| result << str.send(m)}
  return result
end

collection = %w{hello readers}

result_collection = do_collection(:upcase, *collection)
puts result_collection

result_collection = do_collection(:downcase, *collection)
puts result_collection

# Передает хэш
def create_point(x, y, color: "green", size: 1, **h)
  p [x, y, color, size, h]
end

create_point(2, 3, style: "dashed", theme: "dark")


# Распаковка аргументов массивов
def multisum(a,b,*c)
  p c
  sum = c.inject{|sum, num| sum + num}
  p sum + b + a
end

multisum(5,*[1,2,3,4,5])
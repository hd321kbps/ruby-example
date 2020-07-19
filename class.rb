class Human
  # Метод экземпляра не доступен из вне
  def say(word)
    puts "#{word}"
  end
  # Метод класса доступен из вне
  def Human.say(word)
    puts "#{word}"
  end
end

h = Human.new
h.say("Привет")
Human.say("Hello")

def sum(*members)
  p members[0] + members[1]
end

sum(1, 2)
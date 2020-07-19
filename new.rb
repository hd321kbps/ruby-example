# Аналогично одинарным ковычкам
str = %q[text \n]
# Аналогично двойным ковычкам
str1 = %Q[text \n]
# Вывод через функцию
str2 = String.new('text')
String.new(str3 = "text \t \n")

# Текст с форматированием
str4 = <<EOF
test
text2
  text3
EOF

# Конткотенация строк
# Через +
con1 = "str1" + "str2"
# Через <<
con2 = "str2" << "str1"
# Через * n
con3 = "str3" * 3
# Через метод мутабельный
con4 = "str4"
con4.concat(con3)

# замораживание строки - неизменная
str5 = "str"
str.freeze

# Диапозон вывода символов
puts str5[0...2]

# Замена содержимого строки
str6 = "wellcome"
str6[0] = "W"
puts str6
puts str5.length
puts str6.size

# Преобразование строк
str7 = "wellcome worlD"
puts str7.capitalize
puts str7.upcase
puts str7.downcase
puts str7.swapcase

str8 = "good"
str9 = "good2"
str10 = "Good"

# Сравнение строк
# Регистро независимые
puts str8.casecmp(str9)
puts str8.casecmp(str10)

puts str8 == str9
puts str8 == str10

# Регистро зависимые
puts str8.eql?str9
puts str8.eql?str10

puts str8 <=> str9
puts str8 <=> str10
puts "-------------"

# Изменение строк
word = "very slow"
word2 = "blunt"
word3 = "blur"

puts word.split(" ")
puts word2.reverse
puts word3.insert(0, "c")
# хз puts tr(word3, "w")

puts "-----"


puts str, str1, str2, str3, str4
puts '---'
puts con1, con2, con3, con4


# Время и дата
time = Time.new

puts Time.now, time
puts time.zone

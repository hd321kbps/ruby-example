Fam = /(Иванов|Петров)/
TsMark = /так[[:space:]]+себе/

Line1 = /(\w+)\s+(w+)\s*,\s*(\d+)\s*,\s*(хорошо|плохо|так\s+себе)/
# Расширенный синтаксис /x игнорирует пробельные знаки
Line2 = /
  (?:([[:word:]]+) [[:space:]]+)? # имя
  ([[:word:]]+) # фамилия
  [[:space:]]*,[[:space:]]*
  ([[:digit:]]+) # число
  [[:space:]]*,[[:space:]]*
  (хорошо|плохо|так[[:space:]]+себе) # оценка
  /x

TwoSpace = /\s+/

class String
  def simpl
    result = gsub( TwoSpace, ' ' )
    result.gsub!(/^\s/, '' )
    result.gsub!(/\s$/, '' )
    return result
  end
  def simpl!
    gsub!( TwoSpace, ' ' )
    gsub!(/^\s/, '' )
    gsub!(/\s$/, '' )
  end
end

File.open( 'text.txt', 'rt' ).each do |line|
  # puts line if Fam =~ line
  # puts '-----'
  # puts line if TsMark =~ line

  m = Line2.match( line )
  # Пропускать несоответствующие строки
  next unless m
  name = m[1].simpl if m[1]
  # Замена символов
  fam = m[2].simpl
  num = Integer(m[3].simpl)
  mark = m[4].simpl
  puts ":#{name}:#{fam}:#{num}:#{mark}:"
end 
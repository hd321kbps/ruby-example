# класс для работы с http
require 'net/http'

# url = 'samlabs.ws'
# urls = %w{ ya.ru google.ru }
urls = [ 'ya.ru', 'google.ru' ]

urls.each do |url|
  http = Net::HTTP.new( url, 80 )
  result = http.get('/')
  # puts result
  # puts result.body
  # puts result['Content-type']
  # puts "#{url} #{result.message}"
  puts "#{url} #{result.message}"
end

# Многопоточный вариант
urlsm = [ 'mail.ru', 'vk.ru' ]
threads = []

filename = 'res.txt'

# Глобальная костанта
$Out = Mutex.new

File.open( filename, 'wt' ) do |trgfile|
  urlsm.each do |theurl|
    # Открываем поток
    threads << Thread.new( theurl, trgfile ) do |urlm,trg|
      http = Net::HTTP.new( urlm, 80 )
      result1 = http.get('/')

      # Выкидывам исключение если статут не OK
      # raise Exception unless result1.message == 'OK'
      # puts "#{urlm} #{result1.message}"

      # # Записываем в файл at, чтобы выводило больше 1 строки
      # File.open( file, 'at' ) do |trg|
      $Out.lock
      begin
        trg.puts "#{urlm} #{result1.message}"
      ensure
        $Out.unlock
      end
    end
  end

  # Функция закрывающая поток, объязательна
  threads.each do |thr|
    begin
      thr.join
    # Перехватываем исключение
    rescue Exception
      puts 'Error'
    end
  end
end
# encoding: utf-8
# Программа "Волшебный шар" https://ru.wikipedia.org/wiki/Magic_8_ball
# Симулятор Волшебного шара в консоли

# Этот код необходим при использовании русских букв на Windows
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
###

# путь к файлу с ответами
ANSWERS_FILE_PATH = "#{File.dirname(__FILE__)}/data/answers.txt"

# путь к файлу с приветствием
GREETING_FILE_PATH = "#{File.dirname(__FILE__)}/data/greeting.txt"


# открываю файл с ответами
begin
file_answers = File.open(ANSWERS_FILE_PATH, "r:utf-8")
rescue Errno::ENOENT => e
  puts "Файл с ответами не найден"
  abort e.message
end

answers_lines = file_answers.readlines
file_answers.close

# открываю файл с приветствием
begin
file_greeting = File.open(GREETING_FILE_PATH, "r:utf-8")
rescue Errno::ENOENT => e
  puts "Файл с ответами не найден"
  abort e.message
end

greeting_lines = file_greeting.readlines
file_greeting.close

sleep 1 # усыпляю на секундочку

# вывожу приветствие
puts greeting_lines.sample

sleep 3 # еще на 3 секундочки

# отбиваю пустой строкой
puts

# вывожу ответ
puts answers_lines.sample
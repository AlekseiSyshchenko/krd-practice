def command(full_command)
  pos_parentheses = full_command.index('(')
  full_command[0...pos_parentheses].chomp
end

def parse_one_argument(full_command)
  index1 = full_command.index('(') + 1
  index2 = full_command.index(')')
  full_command[index1...index2].chomp
end

def parse_two_arguments(full_command)
  index1 = full_command.index('(') + 1
  index2 = full_command.index(')')
  res = full_command[index1...index2].chomp.split(',')
end

def index(file_name)
  File.foreach(file_name) {|string| puts string}
end

def find(file_name, full_command)
  arg = parse_one_argument(full_command).to_i - 1
  File.open(file_name, 'r') do |file|
    file.each_with_index do |string, index|
      puts("#{index + 1} #{string}") if index == arg
    end
  end
end

def where(file_name, full_command)
  arg = parse_one_argument(full_command)
  File.open(file_name, 'r') do |file|
    file.each_with_index do |string, index|
      puts("#{index + 1} #{string}") if string.include?(arg)
    end
  end
end

def update(file_name, full_command)
  buffer_file = 'buffer.txt'
  args = parse_two_arguments(full_command)
  id = args[0].to_i - 1
  name = args[1]
  buffer = File.open(buffer_file, 'w')
  File.foreach(file_name).with_index do |line, index|
    buffer.puts(index == id ? name : line)
  end
  buffer.close
  File.write(file_name, File.read(buffer_file))
  File.delete(buffer_file) if File.exist?(buffer_file)
end

def delete(file_name, full_command)
  buffer_file = 'buffer.txt'
  id = parse_one_argument(full_command).to_i - 1
  buffer = File.open(buffer_file, 'w')
  File.foreach(file_name).with_index do |line, index|
    if index == id
      next
    else
      buffer.puts(line)
    end
  end
  buffer.close
  File.write(file_name, File.read(buffer_file))
  File.delete(buffer_file) if File.exist?(buffer_file)
end

def create(file_name, full_command)
  str = parse_one_argument(full_command)
  File.open(file_name, 'a+') { |f| f.puts(str) }
end

file_name = ARGV[0]

text = <<~TEXT
  Введите нужную команду:
  index - выводит все строки,
  find(id) - находит конкретную строку в файле,
  where(pattern) - находит все строки, где есть паттерн,
  update(id, text) - обновляет конкретную строку файла,
  delete(id) - удаляет строку,
  create(name) - добавляет строку в конец файла,
  help - подсказка,
  quit - выход из программы.
TEXT

puts "#{text}\n"
File.new(file_name, 'w') unless File.exist? file_name

loop do
  print '%%'
  full_command = $stdin.gets
  command = command(full_command)

  case command
  when 'index'
    index(file_name)
  when 'find'
    find(file_name, full_command)
  when 'where'
    where(file_name, full_command)
  when 'update'
    update(file_name, full_command)
  when 'delete'
    delete(file_name, full_command)
  when 'create'
    create(file_name, full_command)
  when 'help'
    puts "#{text}\n"
  when 'quit'
    exit
  else
    puts 'Нет такой команды'
  end
end

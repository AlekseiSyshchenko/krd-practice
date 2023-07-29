def exit_program(res)
  res.close unless res.closed?
  exit
end

def read_file(file)
  file = File.open(file)
  file_data = file.read
  file.close
  array_data = file_data.split("\n")
end

def files_eq?(data_arr, res_data_arr)
  res_data_arr.sort.uniq == data_arr.sort.uniq
end

def del_empty_line(file)
  original = File.open(file, 'r') { |file_var| file_var.readlines }
  blankless = original.reject{ |line| line.match(/^$/) }
  File.open(file, 'w') do |file_var|
    blankless.each { |line| file_var.puts line }
  end
end

file = 'students.txt'
res_file = 'results.txt'
data = read_file(file)
del_empty_line(res_file)
loop do
  res = File.open(res_file, 'a')
  res_data_arr = read_file(res_file)
  exit_program(res) if files_eq?(data, res_data_arr)

  print 'Введите возраст студента: '
  age = gets.chomp.strip
  exit_program(res) if age == '-1'

  data.each do |str|
    res.puts(str) if str.include? age
  end
  res.close
end

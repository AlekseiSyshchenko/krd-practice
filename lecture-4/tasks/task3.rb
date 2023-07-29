text = <<~TEXT
  Введите команду:
  D(deposit)
  W(withdraw)
  B(balance)
  Q(quit)
TEXT

def check_file(file_name)
  unless File.exist?(file_name)
    file = File.new(file_name, 'w')
    file.puts '100.0'
    file.close
  end
end

def get_acc_amount(file_name)
  file = File.open(file_name)
  acc_amount = file.read.to_f
  file.close
  acc_amount
end

def deposit
  print 'Введите сумму. Сумма должна быть больше нуля. '
  dep_amount = gets.to_f
  if dep_amount.positive?
    dep_amount
  else
    puts 'Сумма должна быть числом большим нуля'
    0
  end
end

def withdraw(acc_amount)
  print "Введите сумму для снятия не более #{acc_amount}: "
  withd_amount = gets.to_f
  if withd_amount.positive? && withd_amount <= acc_amount
    withd_amount
  else
    puts 'Данная сумма не может быть выдана'
    puts 'Сумма должна быть больше нуля и не больше вашего баланса'
    0
  end
end

def quit(acc_amount, file_name)
  File.write(file_name, acc_amount)
  puts 'Благодарим за то, что воспользовались услугами нашего банка!'
  exit
end

file_name = 'balance.txt'
puts "#{text}\n"
check_file(file_name)
acc_amount = get_acc_amount(file_name)


loop do
  print '%%'
  command = gets.upcase.strip.chomp
  case command
  when 'D'
    sum = deposit
    acc_amount += sum
  when 'W'
    sum = withdraw(acc_amount)
    acc_amount -= sum
  when 'B'
    puts "Ваш баланс: #{acc_amount}"
  when 'Q'
    quit(acc_amount, file_name)
  else
    puts 'Нет такой команды'
  end
end

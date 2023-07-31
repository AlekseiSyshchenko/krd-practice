class CashMachine
  def initialize
    @file_name = 'balance.txt'
    unless File.exist?(@file_name)
      file = File.new(@file_name, 'w')
      file.puts '100.0'
      file.close
      @amount = 100.0
    else
      file = File.open(@file_name)
      @amount = file.read.to_f
      file.close
    end
  end

  def init
    help
    main_loop
  end

  private

  def help
    text = <<~TEXT
      Введите команду:
      D(deposit)
      W(withdraw)
      B(balance)
      Q(quit)
    TEXT
    puts "#{text}\n"
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

  def withdraw(amount)
    print "Введите сумму для снятия не более #{amount}: "
    withd_amount = gets.to_f
    if withd_amount.positive? && withd_amount <= amount
      withd_amount
    else
      puts 'Данная сумма не может быть выдана'
      puts 'Сумма должна быть больше нуля и не больше вашего баланса'
      0
    end
  end

  def quit(amount, file_name)
    File.write(file_name, amount)
    puts 'Благодарим за то, что воспользовались услугами нашего банка!'
    exit
  end

  def main_loop
    loop do
      print '%%'
      command = gets.upcase.strip.chomp
      case command
      when 'D'
        sum = deposit
        @amount += sum
      when 'W'
        sum = withdraw(@amount)
        @amount -= sum
      when 'B'
        puts "Ваш баланс: #{@amount}"
      when 'Q'
        quit(@amount, @file_name)
      else
        puts 'Нет такой команды'
      end
    end
  end
end

cashmachine = CashMachine.new
cashmachine.init

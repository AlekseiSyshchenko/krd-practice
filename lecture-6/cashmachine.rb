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

  def deposit(value)
    @amount += value
    File.write(@file_name, @amount)
  end

  def balance
    @amount
  end

  def withdraw(value)
    @amount -= value
    File.write(@file_name, @amount)
  end
end

def foobar(number1, number2)
  #(number1 != 20 && number2 != 20) ? (number1 + number2) : (number1 == 20 ? number2 : number1)

  if number1 != 20 && number2 != 20
    number1 + number2
  elsif number1 == 20
    number2
  else
    number1
  end
end

print 'Введите первое число: '
num1 = gets.to_i
print 'Введите второе число: '
num2 = gets.to_i

result = foobar(num1, num2)
puts result

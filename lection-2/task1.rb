def greeting(name, surname, age)
  if age < 18
    "Привет, #{name} #{surname}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано"
  else
    "Привет, #{name} #{surname}. Самое время заняться делом!"
  end
end


  puts "Введите ваши Имя Фамилию возраст (через пробел)"
  data = gets.chomp
  name, surname, age = data.split
  age = age.to_i

  puts greeting(name, surname, age)

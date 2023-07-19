def greeting(name, surname, age)
  if age < 18
    puts "Привет, #{name} #{surname}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано"
  else
    puts "Привет, #{name} #{surname}. Самое время заняться делом!"
  end
end


puts "Введите ваши Имя Фамилию возраст (через пробел)"
data = gets
name, surname, age = data.split(" ")
age = age.to_i
p name
p surname
p age


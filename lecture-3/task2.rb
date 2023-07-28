def number_pokemons
  print 'Введите количество покемонов: '
  number_of_pokemons = gets.to_i
end

def enter_pokemons(number)
  pokemons = []
  number.times do |i|
    print "Введите имя #{i + 1} покемона: "
    name = gets.chomp
    print "Введите цвет #{i + 1} покемона: "
    color = gets.chomp
    pokemons.push({ name: name, color: color })
  end
  pokemons
end

def format_pokemons(pokemons)
  result = pokemons.to_s
  result = result.gsub(':', ' ').gsub('=>', ': ').gsub('}', ' }')
end

num = number_pokemons
pokemons = enter_pokemons(num)
puts format_pokemons(pokemons)


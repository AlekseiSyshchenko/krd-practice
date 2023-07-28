def check_enter(word)
  if word.nil?
    puts "Use  'ruby task1.rb someword'"
    exit
  end
end

def main(word)
  check_enter(word)
  if word.downcase[-2, 2] == 'cs'
    2**word.length
  else
    word.reverse
  end
end

word = ARGV[0]
puts main(word)

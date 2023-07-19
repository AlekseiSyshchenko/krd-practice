require 'rspec'
require './task1'


RSpec.describe "Task1" do
  it '#greeting less than 18' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("Vasya Pirozhkov 15")
    expect{greeting}.to output("Введите ваши Имя Фамилию возраст (через пробел)\nПривет, Vasya Pirozhkov. Тебе меньше 18 лет, но начать учиться программировать никогда не рано\n").to_stdout
  end

  it '#greeting more than 18' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("John Snow 38")
    expect{greeting}.to output("Введите ваши Имя Фамилию возраст (через пробел)\nПривет, John Snow. Самое время заняться делом!\n").to_stdout

  end
end

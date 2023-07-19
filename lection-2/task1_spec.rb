require 'rspec'
require './task1'


RSpec.describe "Task1" do
  it '#greeting less than 18' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("Vasya Pirozhkov 15")
    expect(greeting('Vasya', 'Pirozhkov', 15)).to eq("Привет, Vasya Pirozhkov. Тебе меньше 18 лет, но начать учиться программировать никогда не рано")
  end
  it '#greeting more than 18' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("John Snow 38")
    expect(greeting('John', 'Snow', 38)).to eq("Привет, John Snow. Самое время заняться делом!")
  end
end

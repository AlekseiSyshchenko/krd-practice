require 'rspec'
require './task2'


RSpec.describe "Task2" do
  it '#foobar get 20 10' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(20, 10)
    expect(foobar(20,10)).to eq(10)
  end

  it '#foobar get 0 20' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(0, 20)
    expect(foobar(0,20)).to eq(0)
  end

  it '#foobar gets numbers other than 20' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(25, 35)
    expect(foobar(25, 35)).to eq(60)
  end
end

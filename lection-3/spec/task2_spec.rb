require '../task2'

RSpec.describe "#task2" do

  it '#number_pokemons > 0' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("5")
    expect(number_pokemons).to eq(5)
  end

   it '#enter_pokemons' do
     allow_any_instance_of(Kernel).to receive(:gets).and_return("Pikachu", "Yellow", "Bulbazavr", "Green")
     expect(enter_pokemons(2)).to eq([{:name => "Pikachu", :color => "Yellow"}, {:name => "Bulbazavr", :color => "Green"}])
   end

  it '#format_pokemons' do
     expect(format_pokemons([{:name => 'Pikachu', :color => 'Yellow'}])).to eq('[{ name: "Pikachu",  color: "Yellow" }]')
  end
end

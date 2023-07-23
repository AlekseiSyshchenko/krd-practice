require '../task1'


RSpec.describe "Task1" do
  it '#main word ends in cs' do
    expect(main("multics")).to eq(128)
  end

  it '#main word doesnt end in cs' do
    expect(main("linux")).to eq("xunil")
  end
end

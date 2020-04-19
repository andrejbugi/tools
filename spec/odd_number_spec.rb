RSpec.describe Tools::OddNumber do
  it 'finds the first integer which appears an odd number of times' do
    odd_example = Tools::OddNumber.new([1, 1, 2, -2, 5, 2, 4, 4, -1, -2, 5, 5])
    expect(odd_example.first_odd_integer).to match(5)
  end

  it 'finds all integers which appear an odd number of times' do
    odd_example = Tools::OddNumber.new([1, 1, 2, -2, 5, 2, 4, 4, -1, -2, 5, 5])
    expect(odd_example.all_odd_integers).to match([5, -1])
  end

  it 'finds the first integer which appears an odd number of times' do
    odd_example = Tools::OddNumber.new([10])
    expect(odd_example.first_odd_integer).to match(10)
  end

  it 'finds all integers which appear an odd number of times' do
    odd_example = Tools::OddNumber.new([10])
    expect(odd_example.all_odd_integers).to match([10])
  end
end
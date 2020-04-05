RSpec.describe Tools::Antipodes do
  it 'gets the average value of the array' do
    given_array = Tools::Antipodes.new [1,5,8,4]
    expect(given_array.division_by_two).to match([2.5, 6.5])
  end

  it 'removes the middle number and gets the average' do
    given_array = Tools::Antipodes.new [1,5,4,8,4]
    expect(given_array.division_by_two).to match([2.5, 6.5])
  end

  it 'returns the input array' do
    given_array = Tools::Antipodes.new [1]
    expect(given_array.division_by_two).to match([1])
  end

  it 'gets the average from negative numbers' do
    given_array = Tools::Antipodes.new [-1,-5,-8,-4]
    expect(given_array.division_by_two).to match([-2.5, -6.5])
  end
end
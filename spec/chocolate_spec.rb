RSpec.describe Tools::ChocolateDilemma do
  it 'shows that they have same area of chocolate' do
    chocolate_example = Tools::ChocolateDilemma.new([[4, 3], [2, 4], [1, 2]], [[6, 2], [4, 2], [1, 1], [1, 1]])
    expect(chocolate_example.fairness?).to be true
  end

  it 'shows that they dont have the same chocolate area' do
    chocolate_example = Tools::ChocolateDilemma.new([[4, 3], [2, 4], [1, 3]], [[6, 2], [4, 2], [1, 1]])
    expect(chocolate_example.fairness?).to be false
  end
end
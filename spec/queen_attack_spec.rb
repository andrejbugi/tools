RSpec.describe Tools::QueenAttack do
  it 'shows that the queens attack each other' do
    queen_coords = Tools::QueenAttack.new([2,3], [6,7])
    expect(queen_coords.attack_each_other?).to be true
  end

  it 'shows that the queens attack each other' do
    queen_coords = Tools::QueenAttack.new([2,7], [0,7])
    expect(queen_coords.attack_each_other?).to be true
  end

  it 'shows that the queens dont attack each other' do
    queen_coords = Tools::QueenAttack.new([2,3], [5,7])
    expect(queen_coords.attack_each_other?).to be false
  end

  it 'returns error - wrong arguments given' do
    queen_coords = Tools::QueenAttack.new([2,10], [6,7])
    expect{ queen_coords.attack_each_other? }.to raise_error(ArgumentError)
  end

  it 'shows that the queens attack each other' do
    queen_coords = Tools::QueenAttack.new([0,4], [2,2])
    expect(queen_coords.attack_each_other?).to be true
  end

  it 'shows that the queens attack each other' do
    queen_coords = Tools::QueenAttack.new([5,5], [2,2])
    expect(queen_coords.attack_each_other?).to be true
  end
end
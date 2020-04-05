RSpec.describe Tools::Grains do
  it 'shows how much grain on square one' do
    expect(Tools::Grains.square(1)).to eq(1)
  end

  it 'shows how much grain on square two' do
    expect(Tools::Grains.square(2)).to eq(2)
  end

  it 'shows how much grains on square three' do
    expect(Tools::Grains.square(3)).to eq(4)
  end

  it 'shows how much grains on square sixteen' do
    expect(Tools::Grains.square(16)).to eq(32_768)
  end

  it 'shows how much grains on square thirty-two' do
    expect(Tools::Grains.square(32)).to eq(2_147_483_648)
  end

  it 'shows how much grains on square sixty-four' do
    expect(Tools::Grains.square(64)).to eq(9_223_372_036_854_775_808)
  end

  it 'shows how much grains in total' do
    expect(Tools::Grains.total).to eq(18_446_744_073_709_551_615)
  end

  it 'raises ArgumentError when negative number' do
    expect{ Tools::Grains.square(-2) }.to raise_error(ArgumentError)
  end

  it 'raises ArgumentError when greater than 64' do
    expect{ Tools::Grains.square(65) }.to raise_error(ArgumentError)
  end

  it 'raises ArgumentError when zero' do
    expect{ Tools::Grains.square(0) }.to raise_error(ArgumentError)
  end
end
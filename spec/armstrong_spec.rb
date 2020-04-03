RSpec.describe Tools::Armstrong do

  # subject(:armstrong) { described_class.new(number) }

  # let(:number) { 9 }

  it 'validates that 9 is an Armstrong number' do
    armstrong = Tools::Armstrong.new(9)
    expect(armstrong.valid?).to be true
  end
  it 'validates that 10 is not an Armstrong number' do
    armstrong = Tools::Armstrong.new(10)
    expect(armstrong.valid?).to be false
  end
  it 'validates that 153 is and Armstrong number' do
    armstrong = Tools::Armstrong.new(153)
    expect(armstrong.valid?).to be true
  end
  it 'validates that 154 is not an Armstrong number' do
    armstrong = Tools::Armstrong.new(154)
    expect(armstrong.valid?).to be false
  end
  it 'converts negative numbers to positive before checking' do
    armstrong = Tools::Armstrong.new(-153)
    expect(armstrong.valid?).to be true
  end
end
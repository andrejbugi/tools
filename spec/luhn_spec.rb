RSpec.describe Tools::Luhn do
  it 'doesn\'t allow single digit strings' do
    luhn_example = Tools::Luhn.new('3')
    expect(luhn_example.valid?).to be false
  end

  it 'doesn\'t allow empty strings' do
    luhn_example = Tools::Luhn.new('')
    expect(luhn_example.valid?).to be false
  end

  it 'doesn\'t allow single zero input' do
    luhn_example = Tools::Luhn.new('0')
    expect(luhn_example.valid?).to be false
  end

  it 'remains valid if digits reversed' do
    luhn_example = Tools::Luhn.new('059')
    expect(luhn_example.reversed).to eq(luhn_example.calc_str)
  end

  it 'remains valid if digits reversed' do
    luhn_example = Tools::Luhn.new('09983')
    expect(luhn_example.reversed).to eq(luhn_example.calc_str)
  end
end

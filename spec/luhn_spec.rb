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
    expect(luhn_example.valid?).to be true
  end

  it 'becomes invalid if digits reversed' do
    luhn_example = Tools::Luhn.new('59')
    expect(luhn_example.valid?).to be true
  end

  it 'is valid canadian sin num' do
    luhn_example = Tools::Luhn.new('055 444 285')
    expect(luhn_example.valid?).to be true
  end

  it 'is invalid canadian sin num' do
    luhn_example = Tools::Luhn.new('055 444 286')
    expect(luhn_example.valid?).to be false
  end

  it 'is invalid credit card' do
    luhn_example = Tools::Luhn.new('8273 1232 7352 0569')
    expect(luhn_example.valid?).to be false
  end

  it 'becomes invalid with non digit' do
    luhn_example = Tools::Luhn.new('055a 444 285')
    expect(luhn_example.valid?).to be false
  end

  it 'becomes invalid with non digit at the end' do
    luhn_example = Tools::Luhn.new('059a')
    expect(luhn_example.valid?).to be false
  end

  it 'becomes invalid with punctuations included' do
    luhn_example = Tools::Luhn.new('055-444-285')
    expect(luhn_example.valid?).to be false
  end

  it 'becomes invalid with symbols included' do
    luhn_example = Tools::Luhn.new('055$ 444$ 285')
    expect(luhn_example.valid?).to be false
  end

  it 'is invalid with space and single zero' do
    luhn_example = Tools::Luhn.new(' 0')
    expect(luhn_example.valid?).to be false
  end

  it 'is valid with more than one zero' do
    luhn_example = Tools::Luhn.new('0000 0')
    expect(luhn_example.valid?).to be true
  end

  it 'is invalid with non digits' do
    luhn_example = Tools::Luhn.new(':9')
    expect(luhn_example.valid?).to be false
  end

  it 'returns input digit 9 as digit 9 in output' do
    luhn_example = Tools::Luhn.new('091')
    expect(luhn_example.valid?).to be true
  end
end

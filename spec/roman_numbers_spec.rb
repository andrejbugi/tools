RSpec.describe Tools::RomanNumbers do
  context 'When entering arabic numbers' do
    it 'transforms them into roman numbers' do
      arabic_numbers = Tools::RomanNumbers.new
      expected = 'CMXCIX'
      expect(arabic_numbers.convert_to_roman(999)).to eq(expected)
    end

    it 'transforms them into roman numbers' do
      arabic_numbers = Tools::RomanNumbers.new
      expected = 'XVI'
      expect(arabic_numbers.convert_to_roman(16)).to eq(expected)
    end

    it 'transforms into roman numbers' do
      arabic_numbers = Tools::RomanNumbers.new
      expect(arabic_numbers.convert_to_roman(3999)).to eq('MMMCMXCIX')
    end
  end
end

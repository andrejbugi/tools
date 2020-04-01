RSpec.describe do
  describe 'full resistor specification' do
    it 'presents the specification' do
      resistor = Tools::Resistors.new(['Blue', 'Yellow', 'Red'])
      expected = '6400 ohms +/-20%'
      expect(resistor.specification).to eq expected
    end

    it 'presents the specification' do
      resistor = Tools::Resistors.new(['Blue', 'Yellow', 'Red', 'Gold'])
      expected = '6400 ohms +/-5%'
      expect(resistor.specification).to eq expected
    end

    it 'presents the specification' do
      resistor = Tools::Resistors.new(['Blue', 'Yellow', 'Red', 'Gold', 'Blue'])
      expected = '6400 ohms +/-5%'
      expect(resistor.specification).to eq expected
    end

    it 'presents the specification' do
      resistor = Tools::Resistors.new(['brown', 'red', 'brown', 'Red'])
      expected = '120 ohms +/-2%'
      expect(resistor.specification).to eq expected
    end

    it 'presents the specification' do
      resistor = Tools::Resistors.new(['gold', 'silver', 'Red', 'red'])
      expected = '0 ohms +/-2%'
      expect(resistor.specification).to eq expected
    end
  end
end
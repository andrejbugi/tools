RSpec.describe Tools::Allergies do

  describe "determine whether or not they're allergic to a given item" do
    it 'matches the allergen with the score' do
      allergies = Tools::Allergies.new(1)
      expect(allergies.allergic_to?('eggs')).to be true
    end

    it 'does not match the allergen with the score' do
      allergies = Tools::Allergies.new(1)
      expect(allergies.allergic_to?('peanuts')).to be false
    end

    it 'matches multiple allergens with one score' do
      allergies = Tools::Allergies.new(3)
      expect(allergies.allergic_to?('eggs')).to be true
      expect(allergies.allergic_to?('peanuts')).to be true
    end
  end
end

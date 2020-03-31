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

  describe 'lists the allergens' do
    it 'shows the allergen list' do
      allergies = Tools::Allergies.new(5)
      list_ex = ['shellfish', 'eggs']
      expect(allergies.score_allergens).to match_array list_ex
    end

    it 'has no allergens' do
      allergies = Tools::Allergies.new(0)
      expect(allergies.score_allergens).to be_empty
    end

    it 'it ignores these components' do
      allergies = Tools::Allergies.new(1024)
      expect(allergies.score_allergens).to be_empty
    end

    it 'returns all the allergens' do
      allergies = Tools::Allergies.new(1023)
      list_ex = ['eggs', 'peanuts', 'shellfish', 'strawberries', 'tomatoes', 'chocolate', 'pollen', 'cats']
      expect(allergies.score_allergens).to match_array list_ex
    end
  end
end

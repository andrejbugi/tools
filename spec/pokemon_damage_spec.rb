RSpec.describe Tools::PokemonDamage do
  it 'returns the right amount of damage' do
    pokemon_example = Tools::PokemonDamage.new("grass", "fire", 35, 5)
    expect(pokemon_example.damage).to eq(175)
  end

  it 'returns the correct damage' do
    pokemon_example = Tools::PokemonDamage.new("fire", "water", 100, 100)
    expect(pokemon_example.damage).to eq(25)
  end

  it 'returns the correct damage' do
    pokemon_example = Tools::PokemonDamage.new("electric", "fire", 100, 100)
    expect(pokemon_example.damage).to eq(50)
  end
end
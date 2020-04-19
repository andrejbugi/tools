RSpec.describe Tools::AdjustTheTime do
  it 'returns the new timestamp' do
    example_time = Tools::AdjustTheTime.new('01:00:00', 1, 30, 10)
    expect(example_time.adjusted).to eq '02:30:10'
  end

  it 'properly adds exceeded seconds to minutes and minutes to hours' do
    example_time = Tools::AdjustTheTime.new("18:22:30", 4, 60, 30)
    expect(example_time.adjusted).to eq "23:23:00"
  end

  it 'resets the hour counter to 00 when exceeds over 24' do
    example_time = Tools::AdjustTheTime.new("00:00:00", 72, 120, 120)
    expect(example_time.adjusted).to eq "02:02:00"
  end
end
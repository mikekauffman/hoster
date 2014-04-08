require 'party_data.rb'
require 'rspec/core'

describe PartyData do

  it 'allows a party to be created with a name, size, and phone number' do

  new_party = PartyData.new('Mike', 4, 7033718749)
  expect(new_party.name).to eq 'Mike'
  expect(new_party.size).to eq 4
  expect(new_party.phone).to eq 7033718749

  end

end
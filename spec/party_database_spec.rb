require 'rspec'
require 'spec_helper'
require_relative '../lib/party_database'

describe PartyDatabase do

  before do
    Sequel::Migrator.run(DB, "migrations")
  end

  after do
    Sequel::Migrator.run(DB, "migrations", target: 0)
  end

  it 'allows for parties to be added to the waiting list' do
    party_table = PartyDatabase.new(DB)
    party_table.create({name: 'Mike', size: 4, phone: 7033718749})
    party_table.create({name: 'Dave', size: 2, phone: 7035554848})
    expect(party_table.all).to eq [
                                    {name: 'Mike', size: 4, phone: 7033718749, :arrival_time => nil},
                                    {name: 'Dave', size: 2, phone: 7035554848, :arrival_time => nil},

                                  ]
  end

  it 'allows a party to be removed from the waiting list' do
    party_table = PartyDatabase.new(DB)
    party_table.create({name: 'Mike', size: 4, phone: 7033718749})
    party_table.create({name: 'Dave', size: 2, phone: 7035554848})
    party_table.delete(7033718749)
    expect(party_table.all).to eq [
                                    {name: 'Dave', size: 2, phone: 7035554848, :arrival_time => nil}
                                  ]
  end

end

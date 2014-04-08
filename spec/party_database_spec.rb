require 'rspec'
require 'spec_helper'
require_relative '../lib/party_database'

describe PartyDatabase do

  PARTYDB = Sequel.connect('postgres://gschool_user:password@localhost/hoster_test_database')

  it 'allows for creating of a task' do

    PARTYDB.create_table! :parties do
      String :name
      Integer :size
      Bigint :phone
    end
    party_table = PartyDatabase.new(PARTYDB)
    party_table.create({name: 'Mike', size: 4, phone: 7033718749})
    party_table.create({name: 'Dave', size: 2, phone: 7035554848})
    expect(party_table.all).to eq [
                                     {name: 'Mike', size: 4, phone: 7033718749},
                                     {name: 'Dave', size: 2, phone: 7035554848}
                                   ]
  end

end

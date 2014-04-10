require 'spec_helper'
require 'party'
describe Party do

  it 'can correctly calculate arrival time when arrival time is nil' do
    party = Party.new(arrival_time: nil, name: 'Bob', size: 4, phone: 5551212)
    expect(party.has_wait_time?).to be_false
    expect(party.wait_time).to be_nil
  end

  it 'can correctly calculate arrival time when given an arrival time' do
    party = Party.new(arrival_time: (Time.now - 50), name: 'Bob', size: 4, phone: 5551212)
    expect(party.has_wait_time?).to be_true
    expect(party.wait_time).to eq(0)

    party = Party.new(arrival_time: (Time.now - 130), name: 'Bob', size: 4, phone: 5551212)
    expect(party.wait_time).to eq(2)
  end

end
require 'spec_helper'
require_relative '../hoster'
require 'capybara/rspec'

Capybara.app = Hoster

feature 'Interacting with the app' do

  before do
    Sequel::Migrator.run(DB, "migrations")
  end

  after do
    Sequel::Migrator.run(DB, "migrations", target: 0)
  end

  scenario 'Welcome displays on the hompage' do
    visit '/'
    fill_in 'party_name', :with => 'Mike'
    fill_in 'party_size', :with => '4'
    fill_in 'party_phone', :with => '7033718749'
    click_on 'Submit'
    expect(page).to have_content 'Mike'
    expect(page).to have_content '4'
    expect(page).to have_content '7033718749'
    expect(page).to have_content 'waiting for 0 minutes'
  end

end
require 'spec_helper'
require_relative '../hoster'
require 'capybara/rspec'

Capybara.app = Hoster

feature 'Interacting with the app' do

  scenario 'Welcome displays on the hompage' do
    visit '/'
    fill_in 'party_name', :with => 'Mike'
    fill_in 'party_size', :with => '4'
    fill_in 'party_phone', :with => '7033718749'
    expect(page).to have_content 'Mike'
    expect(page).to have_content '4'
    expect(page).to have_content '7033718749'
  end

end
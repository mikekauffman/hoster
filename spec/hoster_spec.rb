require 'spec_helper'
require_relative '../hoster'
require 'capybara/rspec'

Capybara.app = Hoster

feature 'Interacting with the app' do

  scenario 'Welcome displays on the hompage' do
    visit '/'
    expect(page).to have_content 'Welcome'
  end

end
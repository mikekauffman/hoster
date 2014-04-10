require 'sinatra/base'
require 'rest-client'
require_relative 'lib/party_database.rb'
require_relative 'lib/party.rb'

class Hoster < Sinatra::Application

  get '/' do
    party_data = PartyDatabase.new(DB)
    parties = []
    party_data.all.each do |row|
      parties << Party.new(row)
    end
    erb :index, locals: {parties: parties}
  end

  post '/new_party' do
    party_data = PartyDatabase.new(DB)
    party_data.create(
      :name => params['party_name'],
      :size => params['party_size'].to_i,
      :phone => params['party_phone'].to_i,
      :arrival_time => Time.now
    )
    redirect '/'
  end

  post '/delete/:name' do
    puts params[:name]
    party_data = PartyDatabase.new(DB)
    party_data.delete(params[:name])
    redirect '/'
  end

end
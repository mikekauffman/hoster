require 'sinatra/base'
require 'rest-client'
require_relative 'lib/party_database.rb'

class Hoster < Sinatra::Application

  get '/' do
    party_data = PartyDatabase.new(DB)
    erb :index, locals: {party_data: party_data}
  end

  post '/new_party' do
    party_data = PartyDatabase.new(DB)
    party_data.create({:name => params['party_name'], :size => params['party_size'].to_i, :phone => params['party_phone'].to_i})
    redirect '/'
  end

end
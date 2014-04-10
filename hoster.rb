require 'sinatra/base'
require_relative 'lib/party_database.rb'
require_relative 'lib/party.rb'
require 'twilio-ruby'

class Hoster < Sinatra::Application

  get '/favicon.ico' do
    # This is here so /favicon.ico doesn't match the /:id route
  end

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

  post '/text/:phone' do
    account_sid = 'ACed7d490605ada89082d0588be5b62908'
    auth_token = 'a34a00e7199e7c09ee448651d1013a03'
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create({
                                      :from => '+12025172698',
                                      :to => params[:phone],
                                      :body => 'Your table is ready'
                                    })
    redirect '/'
  end

end
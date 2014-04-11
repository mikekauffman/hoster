require 'sinatra/base'
require_relative 'lib/party_database.rb'
require_relative 'lib/party.rb'
require 'twilio-ruby'

class Hoster < Sinatra::Application

  get '/favicon.ico' do
    # This is here so /favicon.ico doesn't match the /:id route
  end

  PARTYDB = PartyDatabase.new(DB)

  get '/' do
    parties = []
    PARTYDB.all.each do |row|
      parties << Party.new(row)
    end
    erb :index, locals: {parties: parties}
  end

  post '/new_party' do
    PARTYDB.create(
      :name => params['party_name'],
      :size => params['party_size'].to_i,
      :phone => params['party_phone'].to_i,
      :arrival_time => Time.now
    )
    redirect '/'
  end

  post '/delete/:phone' do
    PARTYDB.delete(params[:phone])
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
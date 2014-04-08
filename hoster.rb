require 'sinatra/base'
require 'rest-client'

class Hoster < Sinatra::Application

  get '/' do
    'Welcome'
  end

end
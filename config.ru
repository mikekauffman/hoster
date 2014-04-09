require 'sequel'

hoster_db = if ENV['HEROKU_POSTGRESQL_JADE_URL'].nil?
              'postgres://gschool_user:password@localhost/hoster_dev_database'
            else
              ENV['HEROKU_POSTGRESQL_JADE_URL']
            end

DB = Sequel.connect(hoster_db)

require './hoster'

run Hoster
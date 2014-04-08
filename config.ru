require 'sequel'

hoster_db = if !ENV['HEROKU_POSTGRESQL_JADE_URL'].nil?
                ENV['HEROKU_POSTGRESQL_JADE_URL']
               else
                 'postgres://gschool_user:password@localhost/hoster_dev_database'
               end

DB = Sequel.connect(hoster_db)

require './hoster'

run Hoster
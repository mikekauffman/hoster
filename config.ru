require 'sequel'

hoster_db = ENV['DATABASE_URL'] || 'postgres://gschool_user:password@localhost/hoster_dev_database'

DB = Sequel.connect(hoster_db)

require './hoster'

run Hoster
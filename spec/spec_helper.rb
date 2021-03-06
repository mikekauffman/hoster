ENV['RACK_ENV'] = 'test'
require 'sequel'
Sequel.extension :migration

DB = Sequel.connect('postgres://gschool_user:password@localhost/hoster_test_database')

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end

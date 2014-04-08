require 'pg'
require 'sequel'

class PartyDatabase

  def initialize(database)
    @database_table = database[:parties]
  end

  def create(attributes)
    @database_table.insert(attributes)
  end

  def all
    @database_table.to_a
  end

  def find(name)
    @database_table.where(:name => name).to_a[0]
  end

  def delete(name)
    @database_table.where(:name => name).delete
  end

end
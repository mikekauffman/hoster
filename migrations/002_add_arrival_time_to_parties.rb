Sequel.migration {

  up do
    add_column :parties, :arrival_time, DateTime
  end

  down do
    drop_column :parties, :arrival_time
  end

}
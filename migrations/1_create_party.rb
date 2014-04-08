Sequel.migration {

  up do
    create_table(:parties) do
      String :name
      Integer :size
      Bigint :phone
    end
  end

  down do
    drop_table(:parties)
  end

}
class Party
  attr_reader :name, :size, :phone

  def initialize(attributes)
    @attributes = attributes
    @name = @attributes[:name]
    @size = @attributes[:size]
    @phone = @attributes[:phone]
    @arrival_time = @attributes[:arrival_time]
  end

  def has_wait_time?
    !!@arrival_time
  end

  def wait_time
    ((Time.now - @arrival_time)/60).to_i if @arrival_time
  end

end
class Trailer 
  attr_reader :name, :key

  def initialize(data)
    @name = data[:name]
    @key = data[:key]
  end
end
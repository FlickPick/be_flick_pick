class Cast 
  attr_reader :names

  def initialize(data)
    @names = find_cast_names(data)
  end

  def find_cast_names(data)
    data[:cast].take(5).map { |member| member[:name] }
  end
end
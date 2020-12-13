class Deserializer
  def initialize(data)
    @valera = Valera.new
    @valera.stats = data
    @valera.stats['alive'] = true
  end

  def deserializer
    @valera
  end
end

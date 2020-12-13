require_relative '../../valera'

class Serializer
  def initialize(valera)
    @valera = valera
  end

  def serialize
    {
      'health' => @valera.stats['health'],
      'mana' => @valera.stats['mana'],
      'fun' => @valera.stats['fun'],
      'fatigue' => @valera.stats['fatigue'],
      'money' => @valera.stats['money']
    }
  end
end

require 'yaml'
require_relative 'serializer'

class Saver
  def initialize(file_name, valera)
    @file_name = File.expand_path("../_saves/#{file_name}.yaml", __dir__)
    @valera = valera
  end

  def save
    yaml = Serializer.new(@valera).serialize.to_yaml
    File.open(@file_name, 'w') { |file| file.write(yaml) }
  end
end

require 'yaml'
require 'pathname'
require_relative 'deserializer'

class Loader
	def initialize(file_name)
		@file_name = File.expand_path("../_saves/#{file_name}.yaml", __dir__)
	end

	def Valid?
		Pathname.new(@file_name).exist?
	end

	def load
		data = YAML.safe_load(File.open(@file_name))
		Deserializer.new(data).deserializer
	end
end

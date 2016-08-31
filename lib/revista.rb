# coding: utf-8
class Revista
	attr_reader :titulo, :id
	attr_accessor :valor #permite escrita no atributo "valor"

	def initialize(titulo, valor)
		@titulo = titulo
		@valor = valor
		@id = self.class.next_id #Atribui um id ao objeto revista
	end

	def save
		File.open("db/revistas/#{@id}.yml", "w") do |file|
			file.puts serialize
		end
	end

	def self.find(id)
		YAML.load File.open("db/revistas/#{id}.yml", "r")
	end

	private

	def serialize
		YAML.dump self
	end

	def self.next_id
		Dir.glob("db/revistas/*.yml").size + 1
	end

end
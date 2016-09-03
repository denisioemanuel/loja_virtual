# coding: utf-8

class Revista
	attr_reader :titulo, :id, :destroyed, :new_record
	attr_accessor :valor #permite escrita no atributo "valor"
	
	def initialize(titulo, valor)
		@titulo = titulo
		@valor = valor
		@id = self.class.next_id #Atribui um id ao objeto revista
		@destroyed = false
		@new_record = true
	end

	def save
		@new_record = false
		File.open("db/revistas/#{@id}.yml", "w") do |file|
			file.puts serialize
		end
	end

	def self.find(id)
		raise StandardError, "Arquivo db/revistas/#{id} não encontrado.", caller
			unless File.exists?("db/revistas/#{id}.yml")
		YAML.load File.open("db/revistas/#{id}.yml", "r")
		end
		# begin 
		# 	YAML.load File.open("db/revistas/#{id}.yml", "r")
		# rescue
		# 	p "Arquivo db/revistas/#{id} nao encontrado."
		# end
	end

	def destroy
		unless @destroyed or @new_record
			@destroyed = true
			FileUtils.rm "db/revistas/#{@id}.yml"
		end
	end

	private

	def serialize
		YAML.dump self
	end

	def self.next_id
		Dir.glob("db/revistas/*.yml").size + 1 #Saber a qunntidade de arquinos na pasta
	end

end
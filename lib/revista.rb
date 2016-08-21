# coding: utf-8
class Revista

	@id = 0

	def self.id
		@id += 1
	end

	def initialize(titulo)
		@id = self.class.id
		@titulo = titulo
	end

	def titulo
		@titulo
	end

	def id
		@id
	end

	def titulo_formatado
		titulo_upcase = @titulo.upcase
		"Titulo: #{titulo_upcase}"
	end

end
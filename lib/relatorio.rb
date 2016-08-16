class Relatorio
	def initialize(biblioteca)
		@biblioteca = biblioteca
	end
	
	#Simplificando com a API Enumrable
	def total
		@biblioteca.livros.map(:preco).inject(:+)
	end

	def titulos
		@biblioteca.livros.map &:titulo
	end

end
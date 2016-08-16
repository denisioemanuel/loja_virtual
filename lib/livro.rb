class Livro < Midia
	attr_reader :categoria, :isbn, :autor

	include FormatadorMoeda

	def initialize(titulo, autor, isbn="1", pagina, preco, categoria)
		super()
		@titulo = titulo
		@autor 	= autor
		@isbn 	= isbn
		@pagina = pagina
		@preco	= preco
		@categoria = categoria
		#@desconto = 0.15
	end

	#Sobrecarga
	def to_s
		puts "Titulo: #{@titulo}, Autor: #{@autor}, Isbn: #{@isbn}, Página: #{@pagina}, Preço: #{@preco}, Categoria: #{@categoria}"
	end

	#Sobrecarga (Deve ser sobreescrito quando queremos comprar se um objeto é igual ao outro objetos)
	def eql?(outro_livro)
		@isbn == outro_livro.isbn
	end

	#Sobrecarga
	def hash
		@isbn.hash
	end

end 
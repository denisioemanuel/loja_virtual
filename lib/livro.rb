class Livro < Midia
  attr_reader :categoria, :isbn, :autor

  # => include FormatadorMoeda

  def initialize(titulo, autor, isbn = "1", numero_de_paginas, valor, categoria)
    @titulo = titulo
    @autor = autor
    @isbn = isbn
    @numero_de_paginas = numero_de_paginas
    @valor = valor
    @categoria = categoria
    @desconto = 0.15
  end

  def to_s
    "Autor: #{@autor} | ISBN: #{@isbn} | Pág: #{@numero_de_paginas} | Preço: #{@preco} | Categoria: #{@categoria}"
  end

  #Sobreescrita
  def eql?(outro_livro)
    @isbn == outro_livro.isbn
  end

  def hash
    @isbn.hash
  end

end

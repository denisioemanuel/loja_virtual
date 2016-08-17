module VendaFacil
  class Set

    def initialize
      @banco_de_arquivos = BancoDeArquivos.new
    end

    def adiciona(livro)
      salva livro do
        @livros[livro.categoria] ||=[]
        @livros[livro.categoria] << livro
      end
    end

    def livros
      @livros.values.flatten
    end

    def livros_por_categoria(categoria)
      @livros.select {|livro| livro.categoria = categoria  }
    end

    private

    def livros
      @livros ||= @banco_de_arquivos.carrega
    end

    def salva(livro)
      @banco_de_arquivos.salva livro
      yield
    end
  end

end

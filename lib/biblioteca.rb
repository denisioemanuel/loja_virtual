class Biblioteca
  #attr_reader :livros

  include Enumerable

  def initialize
    @banco_de_arquivos = BancoDeArquivos.new
  end

  def adiciona(livro)
    salva livro do
      livros << livro
    end
  end

  def livros
    @livros.values.flatten
  end

  def livros_por_categoria(categoria)
    @livros.select { |livro| livro.categoria == categoria  }
  end

  def livros
    @livros ||= @banco_de_arquivos.carrega
  end

  #Chamando o método each que possibilita que os outros métodos do módulo
  #enumerable funcionem em uma instância de Bibliotea
  def each
    livros.each{ |livro| yield livro }
  end

  private

  def salva(livro)
    @banco_de_arquivos.salva livro
    yield
  end

end

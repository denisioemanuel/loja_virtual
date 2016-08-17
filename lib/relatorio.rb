class Relatorio
  def initialize (biblioteca)
    @biblioteca = biblioteca
  end

=begin
  def total
    soma = 0.0
    @biblioteca.livros.each do |livro|
      soma += livro.preco
    end
    soma
  end
=end
  #Método melhorado acima.
=begin
  def total
    @biblioteca.livros.inject(0){|total, livro| total+= livro.preco }
  end
=end
#Versão melhorada
  def total
    @biblioteca.livros.map(&:preco).inject(:+)
  end
=begin
  def titulos
    titulos = []
    @biblioteca.livros.each do |livro|
      titulos << livro.titulo
    end
    titulos
  end
=end
  #Fazendo mesmo método utilizando a API Enumarable "map".
=begin
  def titulos
    @biblioteca.livros.map { |livro| livro.titulo }
  end
=end
  #função map simplificada
  def titulos
    @biblioteca.livros.map &:titulo
  end
end

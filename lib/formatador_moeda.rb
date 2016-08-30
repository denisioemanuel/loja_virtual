#lib/formatador_moeda.rb
module FormatadorMoeda
 #método de instancia 
	def metodo_de_instancia
		"Metodo de instancia qualquer"
	end

	#Méodulo que guarda os métodos da classe
	module ClassMethod
	 def formata_moeda(*variaveis_e_metodos)
	  	variaveis_e_metodos.each do |name|
			define_method("#{name}_formatado") do
				valor = respond_to?(name) ? send(name) : instance_variables_get("@#{name}")
				"R$ #{valor}"
			end  		
	  	end
	  end
	end

	#hook method que é executado quando incluímos o módulo
	# dentro de alguma classe, recebendo no argumento
	# classe_que_incluiu_modulo o objeto %%Class%% que
	# representa a classe que incluiu o módulo
	
	def self.included(classe_que_incluiu_modulo) 
		classe_que_incluiu_modulo.extend ClassMethod
	end

end

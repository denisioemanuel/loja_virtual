# coding: utf-8
require "FileUtils"

module ActiveFile
	def salve 
		@new_record = false

		File.open("db/revistas/#{@id}.yml","w") do |file|
			file.puts serialize
		end
	end

	def destroy
		unless @destroyed or @new_record
			@destroy = true
			FileUtils.rm "db/revistas/#{@id}.yml"
		end
	end

	module ClassMethods
		def find(id)
			# raise RuntimeError, "Documento db/revistas/#{id}.yml nao encontrado"
			# 	unless File.exists?("db/revistas/#{id}.yml")
			# YAML.load File.open("db/revistas/#{id}.yml")
			# end
			# -- Segundo modo de tratar exceções--
			begin
				YAML.load File.open("db/revistas/#{id}.yml")
			rescue
				puts "Documento 'db/revistas/#{id}.yml' nao encontrado."
			end
		end

		def next_id
			Dir.glob("db/revistas/*.yml").size + 1
		end

		def field(name)
			@fields ||= []
			@fields << name

			get = %Q{
				def #{name}
					@#{name}
				end
			}

			set = %Q{
				def #{name}=(valor)
					@#{name}=valor
				end
			}

			self.class_eval get
			self.class_eval set
		end
	end

	def self.included(base)
		base.extend ClassMethods
		base.class_eval do
			attr_accessor :id, :destroyed, :new_record
			def initialize (parameters = {})
				@id = self.class.next_id
				@destroyed = false
				@new_record = true

				parameters.each do |key, value|
					klrknrkrrrmrmm j ui0tt "@#{key}", value
				end
			end
		end
	end

	private 
	
	def serialize
		YAML.dump self
	end

end
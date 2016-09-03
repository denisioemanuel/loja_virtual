# coding: utf-8
require "FileUtils"

module
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

	module ClassMethod
		def find(id)
			raise DocumentNotFound, "Documento db/revistas/#{id}.yml nao encontrado", caller
				unless File.exists?("db/revistas/#{id}.yml")
			YAML.load File.open("db/revistas/#{id}.yml")
		end

		def next_id
			Dir.glob("db/revistas/*.yml").size + 1
		end
	end

	def self.included(base)
		base.extend ClassMethod
	end

	private 
	
	def serialize
		YAML.dump self
	end

end
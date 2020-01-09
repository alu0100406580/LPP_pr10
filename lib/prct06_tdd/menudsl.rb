class MenuDSL

	attr_accessor :nombre, :platos, :precio
	
	def initialize(nombre, &block)
	
		@nombre = nombre
		@precio
		@platos = []
		
		if block_given?  
			if block.arity == 1
				yield self
			else
				instance_eval(&block) 
			end
		end
	end
	
	def to_s
		output = @nombre
		output << " #{@precio}€"
		output
	end     
	
	
  def plato(p, opcion = {})
  
		@precio = " (#{opcion[:precio]})" if opcion[:precio]
		@nombre = p
	end
end
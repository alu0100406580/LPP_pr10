class PlatoDSL

	attr_accessor :nombre, :ingredientes, :valorNutricional
	
	def initialize(nombrePlato, &block)
	
		@nombrePlato = nombrePlato
    @valorNutricional
    @valorAmbiental
		@ingredientes = []
		
		if block_given?  
			if block.arity == 1
				yield self
			else
				instance_eval(&block) 
			end
		end
	end
	
	def to_s
		output = @nombrePlato
		output << " \n Valor Nutricional #{@valorNutricional}, Valor Ambiental #{@valorAmbiental} Ingredientes: #{@ingredientes.join(', ')}\n"
		output
	end     
	
	
	def ingrediente(nombrePlato, opcion = {})
		ingrediente = nombrePlato
		ingrediente << " (#{opcion[:gramos]})" if opcion[:gramos]
		@valorNutricional = " (#{opcion[:valorNutricional]})" if opcion[:valorNutricional]
		@valorAmbiental = " (#{opcion[:valorAmbiental]})" if opcion[:valorAmbiental]
		@ingredientes << ingrediente
	end
end
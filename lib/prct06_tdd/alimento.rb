class Alimento

  attr_reader :nombre, :proteinas, :carbohidratos, :lipidos, :gasEfectoInv, :terrenoAño
  attr_accessor :nombre, :proteinas, :carbohidratos, :lipidos, :gasEfectoInv, :terrenoAño

  def initialize(nombre = "", proteinas = 0.0, carbohidratos = 0.0, lipidos = 0.0, gasEfectoInv = 0.0, terrenoAño = 0.0)
      @nombre = nombre
      @proteinas = proteinas
      @carbohidratos = carbohidratos
      @lipidos = lipidos
      @gasEfectoInv = gasEfectoInv
      @terrenoAño = terrenoAño
  end

  def identificador
    "El alimento es: #{@nombre}"
  end

end
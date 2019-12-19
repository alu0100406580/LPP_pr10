##
# Clase Alimento
# Métodos:
# initialize
# is_empty?
# insertaAdelante
# insertaAtras
# insertaArray
# extraerDelante
# pos: da el valor en la posiicón
# to_s
# 
class Alimento
  ##
  # Módulo Comparable
  include Comparable
  
  ##
  # getters :nombre, :proteinas, :carbohidratos, :lipidos, :gasEfectoInv, :terrenoAño
  attr_reader :nombre, :proteinas, :carbohidratos, :lipidos, :gasEfectoInv, :terrenoAño
  ##
  # setters y getters :nombre, :proteinas, :carbohidratos, :lipidos, :gasEfectoInv, :terrenoAño
  attr_accessor :nombre, :proteinas, :carbohidratos, :lipidos, :gasEfectoInv, :terrenoAño

  ##
  # def initialize()
  #   @nombre = nombre
  #   @proteinas = proteinas
  #   @carbohidratos = carbohidratos
  #   @lipidos = lipidos
  #   @gasEfectoInv = gasEfectoInv
  #   @terrenoAño = terrenoAño
  # end
  def initialize(nombre = "", proteinas = 0.0, carbohidratos = 0.0, lipidos = 0.0, gasEfectoInv = 0.0, terrenoAño = 0.0)
      @nombre = nombre
      @proteinas = proteinas
      @carbohidratos = carbohidratos
      @lipidos = lipidos
      @gasEfectoInv = gasEfectoInv
      @terrenoAño = terrenoAño
  end

  ##
  # Nos muestra el Nombre del alimento formateado
  def identificador
    "El alimento es: #{@nombre}"
  end

  ##
  # Nos muestra las emisiones formateadas
  def emisiones
    "Las emisiones son de: #{@gasEfectoInv} kgCO^2eq"
  end

  ##
  # Nos muestra el terreno formateado
  def terreno
    "El terreno utilizado es de: #{@terrenoAño} m^2/año"
  end

  ##
  # Nos muestra la salida de un alimento formateado
  def to_s
    "#{@nombre}: proteínas #{@proteinas}, carbohidratos #{@carbohidratos}, lípidos #{@lipidos}, emisiones #{@gasEfectoInv}, terreno #{@terrenoAño}"
  end
  
  ##
  # Nos da el valor energético del alimento
  def valorEnergetico
    ( @carbohidratos * 4 + @lipidos * 9 + @proteinas * 4 )
  end

  ##
  # Nos permite que se puedan comparar dos alimentos
  def <=>(other)
    return nil unless other.instance_of? Alimento
    ( self.valorEnergetico + self.gasEfectoInv ) <=> ( other.valorEnergetico + other.gasEfectoInv )
  end

end
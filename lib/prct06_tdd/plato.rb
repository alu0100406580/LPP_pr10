##
# Clase Plato
# Métodos:
# initialize
# vctCalculo
# proteinasCalculo
# lipidosCalculo
# hidratosCalculo
# huellaNutricional
# to_s
# 

class Plato
  ##
  # Modulo Comparable
  include Comparable
  ##
  # los getters y setters :nombre, :listaAlimentos, :listaGramos, :vct, :porcenProteinas, :porcenLipidos, :porcenHidratos
  attr_accessor :nombre, :listaAlimentos, :listaGramos, :vct, :porcenProteinas, :porcenLipidos, :porcenHidratos

  ##
  # El initialize de Plato donde se inicializan todas las variables de instancia
  def initialize( nombre, listaAlimentos, listaGramos )

    @nombre = nombre
    if listaAlimentos.kind_of?( Lista )
      @listaAlimentos = listaAlimentos
    else
      @listaAlimentos = Lista.new( listaAlimentos )
    end
    if listaGramos.kind_of?( Lista )
      @listaGramos = listaGramos
    else
      @listaGramos = Lista.new( listaGramos )
    end
    @vct = vctCalculo
    @porcenProteinas = proteinasCalculo
    @porcenLipidos = lipidosCalculo
    @porcenHidratos = hidratosCalculo
  end

  ##
  # Metodo con el se calcula el vct
  def vctCalculo()

    vct = 0
    index = 0
    @listaAlimentos.each do | x |
      index += 1
      y = @listaGramos.pos( index )
      vct += ( ( x.valorEnergetico / 100 ) * y )
    end
    vct.round()
  end

  ##
  #Metodo con el que se calculan las proteinas
  def proteinasCalculo()

    proteinas = 0
    index = 0
    sumaTotalGramos = 0
    @listaGramos.each { | gr | sumaTotalGramos += gr }
    @listaAlimentos.each do | x |
      index += 1
      y = @listaGramos.pos( index )
      proteinas += ( ( x.proteinas / 100 ) * y )
    end
    (proteinas * 100 / sumaTotalGramos).round()
  end

  ##
  #Metodo con el que se calculan los lípidos
  def lipidosCalculo()
    
    lipidos = 0
    index = 0
    sumaTotalGramos = 0
    @listaGramos.each { | gr | sumaTotalGramos += gr }
    @listaAlimentos.each do | x |
      index += 1
      y = @listaGramos.pos( index )
      lipidos += ( ( x.lipidos / 100 ) * y )
    end
    (lipidos * 100 / sumaTotalGramos).round()
  end


  ##
  #Metodo con el que se calculan los hidratos
  def hidratosCalculo()
    
    hidratos = 0
    index = 0
    sumaTotalGramos = 0
    @listaGramos.each { | gr | sumaTotalGramos += gr }
    @listaAlimentos.each do | x |
      index += 1
      y = @listaGramos.pos( index )
      hidratos += ( ( x.carbohidratos / 100 ) * y )
    end
    (hidratos * 100 / sumaTotalGramos).round()
  end

  ##
  #Metodo con el que se formatea la salida 
  def to_s()
    "#{@nombre}: proteinas = #{@porcenProteinas}%, lipidos = #{@porcenLipidos}%, hidratos = #{@porcenHidratos}%, vct = #{@vct}Kcal"
  end

  ##
  #Metodo con el que se calcula la huella nutricional y da su índice de salida
  def huellaNutricional()
    
    if ( @vct <= 670 )
      return 1
    elsif ( @vct >= 670 && @vct <= 830 )
      return 2
    else
      return 3
    end
  end


  ##
  #Metodo para que los platos sean comparables
  def <=>(other)
    return nil unless other.kind_of? Plato
      self.vct <=> other.vct
  end
end

##
# Clase PlatoAmbiental
# Clase que define un plato ambiental 
# métodos: 
# initialize
# emisionesCalculo
# metrosCalculo
# eficienciaEnergetica
# huellaNutricional
#

class PlatoAmbiental < Plato

  ##
  # los getters y setters :emisionesDiarias, :metrosUsoTerreno, :vct, :porcenProteinas, :porcenLipidos, :porcenHidratos
  attr_accessor :emisionesDiarias, :metrosUsoTerreno, :vct, :porcenProteinas, :porcenLipidos, :porcenHidratos

  ##
  # El initialize de PlatoAmbiental
  def initialize( nombre, listaAlimentos, listaGramos )    
    super( @nombre = nombre, @listaAlimentos = listaAlimentos, @listaGramos = listaGramos )
    @vct = vctCalculo 
    @porcenProteinas = proteinasCalculo
    @porcenLipidos = lipidosCalculo
    @porcenHidratos = hidratosCalculo
    @emisionesDiarias = emisionesCalculo
    @metrosUsoTerreno = metrosCalculo
  end


  ##
  #Metodo con el que se calculan las emisiones de plato Ambiental
  def emisionesCalculo()
    
    emisiones = 0
    index = 0
    @listaAlimentos.each do | x |
      index += 1
      y = @listaGramos.pos( index )
      emisiones += ( ( x.gasEfectoInv / 100 ) * y )
    end
    emisiones.round()
  end


  ##
  #Metodo con el que se calcula los metros cuadrados
  def metrosCalculo()
    
    metros = 0
    index = 0
    @listaAlimentos.each do | x |
      index += 1
      y = @listaGramos.pos( index )
      metros += ( ( x.terrenoAño / 100 ) * y )
    end
    metros.round()
  end


  ##
  #Metodo con el que se calcula la eficiencia energética
  def eficienciaEnergetica()
    "EficienciaEnergética -> #{@nombre}: #{@emisionesDiarias}kgCO2eq, #{@metrosUsoTerreno}Terreno m^2/año"
  end


  ##
  #Metodo con el que se calcula la huella Nutricional para plato Ambiental
  def huellaNutricional()
    
    if ( @vct <= 670 )
      indicadorEnergia = 1
    elsif ( @vct >= 670 && @vct <= 830 )
      indicadorEnergia = 2
    else
      indicadorEnergia = 3
    end

    if ( self.instance_of? PlatoAmbiental )
      if ( @emisionesDiarias <= 800 )
        indicadorCarbono = 1
      elsif ( @emisionesDiarias >= 800 && @emisionesDiarias <= 1200 )
        indicadorCarbono = 2
      else
        indicadorCarbono = 3
      end
      return ( indicadorEnergia + indicadorCarbono ) / 2

    else
      return indicadorEnergia
    end
  end

  ##
  #Metodo para que los Platos Ambientales sean comparables
  def <=>(other)
    return nil unless other.kind_of? Plato
    if ( other.instance_of? PlatoAmbiental )
      return ( self.vct + self.emisionesDiarias + self.metrosUsoTerreno ) <=> ( other.vct + other.emisionesDiarias + other.metrosUsoTerreno )
    else
      return self.vct <=> other.vct
    end
  end
end
class Plato

  attr_accessor :nombre, :listaAlimentos, :listaGramos, :vct, :porcenProteinas, :porcenLipidos, :porcenHidratos

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

  def vctCalculo

    vct = 0
    index = 0
    @listaAlimentos.each do | x |
      index += 1
      y = @listaGramos.pos( index )
      vct += ( ( x.valorEnergetico / 100 ) * y )
    end
    vct.round()
  end

  def proteinasCalculo

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

  def lipidosCalculo
    
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

  def hidratosCalculo
    
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

  def to_s
    "#{@nombre}: proteinas = #{@porcenProteinas}%, lipidos = #{@porcenLipidos}%, hidratos = #{@porcenHidratos}%, vct = #{@vct}Kcal"
  end


end
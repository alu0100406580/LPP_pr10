class Plato

  attr_accessor :nombre, :listaAlimentos, :listaGramos, :listaGramos

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
  end

end
# create a Struct with :value, :next and :prev
Node = Struct.new(:value, :next, :prev)


class Lista

  include Enumerable
  include Comparable
    
  attr_accessor :cabeza, :cola, :tamaño

  def initialize()
    @cabeza = nil
    @cola = nil
    @tamaño = 0
  end

  def is_empty?
    return self.tamaño.zero?
  end

  def insertaAdelante(valor) 

    nodo = Node.new(valor,nil,nil)    
    if (self.tamaño == 0)
      @cabeza = nodo
      @cola = nodo
    else
      nodo["next"] = @cabeza
        @cabeza.prev = nodo
        @cabeza = nodo
    end
      @tamaño = @tamaño + 1
  end
  
  def insertaAtras(valor)

    nodo = Node.new(valor,nil,nil)
    if (self.tamaño == 0)
      @cabeza = nodo
      @cola = nodo
    else
      nodo["prev"] = @cola
      @cola.next = nodo
      @cola = nodo
    end
    @tamaño = @tamaño + 1
  end

  def extraerDelante
    if(self.tamaño == 0)
       return "Lista Vacía"
    else
       nodoAux = @cabeza
       @cabeza = @cabeza["next"]
       @tamaño = @tamaño - 1
       return nodoAux["value"]
    end
  end

  def extraerDetras
    if(self.tamaño == 0)
      return "Lista Vacía"
    else
      nodoAux = @cola
      @cola = @cola["prev"]
      @tamaño = @tamaño - 1
      return nodoAux["value"]
    end
  end

end
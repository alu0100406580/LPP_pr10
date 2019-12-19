##
# create a Struct with :value, :next and :prev
Node = Struct.new(:value, :next, :prev)

##
# Clase Lista
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

class Lista

  ##
  # Módulo Enumerable
  include Enumerable
  
  ##
  # los getters y setters :cabeza, :cola, :tamaño
  attr_accessor :cabeza, :cola, :tamaño

  ##
  # def initialize()
  #   @cabeza = nil
  #   @cola = nil
  #   @tamaño = 0
  # end

  def initialize( arr = nil )
    @cabeza = nil
    @cola = nil
    @tamaño = 0
    unless arr.nil?
      self.insertaArray( arr )
    end
  end

  ##
  # El método para saber si la lista está vacía
  def is_empty?
    return self.tamaño.zero?
  end

  ##
  # Método para insertar delante
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

  ##
  # Método para insertar atrás
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

  ##
  # Método para insertar un array
  def insertaArray( arr )
    if arr.kind_of?( Array )
      while ( arr.length != 0)
        self.insertaAtras( arr.shift )
      end
    end
  end

  ##
  # Método para extraer delante el elemento
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

  ##
  # Método para extraer detrás del elemento
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

  ##
  # Método mostrar la lista formateada
  def to_s
    nodoAux = @cabeza
    arr = []
    if (self.tamaño == 0)
        return "Lista Vacía"
    else
        while(nodoAux != nil)                
            arr.push nodoAux["value"]
            nodoAux = nodoAux["next"]
        end
        return arr
    end
  end

  ##
  # Método para mostrar el elemento en la posición deseada
  def pos( pos )
    i = 1
    self.each do | x |
      if i == pos
        return x
      end 
      i += 1
    end
    nodoAux = Node.new(nil,nil,nil)
    nodoAux = @cola
    return nodoAux["value"]
  end

  ##
  # Método para que la lista pueda ser enumarada correctamente
  def each
    nodoAux = Node.new(nil,nil,nil)
    nodoAux = @cabeza
    while nodoAux != nil do
        yield nodoAux["value"]
        nodoAux = nodoAux["next"]
    end
  end
end
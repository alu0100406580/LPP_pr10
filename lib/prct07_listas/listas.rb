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
end
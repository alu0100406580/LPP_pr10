RSpec.describe Prct06Tdd do
  it "has a version number" do
    expect(Prct06Tdd::VERSION).not_to be nil
  end

  before :each do
    @chocolate = Alimento.new( "chocolate", 5.3, 47.0, 30.0, 2.3, 3.4 )
    @pollo = Alimento.new( "pollo", 20.6, 0.0, 5.6, 5.7, 7.1 )
    @queso = Alimento.new( "queso",  25.0, 1.3, 33.0, 11.0, 41.0 )
    @tofu = Alimento.new( "tofu", 8.0, 1.9, 4.8, 2.0, 2.2 )
    @carne_vaca = Alimento.new( "carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.0 )
    @cerveza = Alimento.new( "cerveza",  0.5, 3.6, 0.0, 0.24, 0.22 )
    @carne_cordero = Alimento.new( "carne de cordero",  18.0, 0.0, 17.0, 20.0, 185.0 )
    @salmon = Alimento.new( "salmón", 19.9, 0.0, 13.6, 6.0, 3.7 )
    @lentejas = Alimento.new( "lentejas", 23.5, 52.0, 1.4, 0.4, 3.4 )
    @nuez = Alimento.new( "nuez",  20.0, 21.0, 54.0, 0.3, 7.9 )
    @leche_vaca = Alimento.new( "leche de vaca", 3.3, 4.8, 3.2, 3.2, 8.9 )
    @huevos = Alimento.new( "huevos",  13.0, 1.1, 11.0, 4.2, 5.7 )
    @camarones = Alimento.new( "camarones", 17.6, 1.5, 0.6, 18.0, 2.0 )
    @cerdo = Alimento.new( "cerdo", 21.5, 0.0, 6.3, 7.6, 11.0 )
    @cafe = Alimento.new( "café", 0.1, 0.0, 0.0, 0.4, 0.3 )
    
    @alimentos = [ @chocolate, @chocolate, @chocolate, @chocolate, @nuez, @huevos ]
    @alimentos2 = [ @chocolate, @chocolate, @chocolate, @nuez, @cerveza, @leche_vaca ]

    def impactoAmbientalHombre( alimentos )
      
      cdr = 0
      proteinas = 0
      gases = 0.0
      alimentos.each do | item |
        cdr += item.valorEnergetico()
        proteinas += item.proteinas()
        gases += item.gasEfectoInv
      end
      "Con este menú obtiene el #{(cdr/30.0).round}% CDR Kcal, y proteinas #{proteinas}g/54g con una emisión de #{gases}KgCO2eq"
    end

    def impactoAmbientalMujer( alimentos )
      
      cdr = 0
      proteinas = 0.0
      gases = 0.0
      alimentos.each do | item |
        cdr += item.valorEnergetico()
        proteinas += item.proteinas()
        gases += item.gasEfectoInv
      end
      "Con este menú obtiene el #{(cdr/23.0).round}% CDR Kcal, y proteinas #{proteinas.round}g/41g con una emisión de #{gases}KgCO2eq"
    end
  
  end

  it "Creamos la clase Alimento" do
    expect( Alimento.new() ).not_to eq( nil )
  end

  it "Creamos los alimentos de manera correcta" do
    expect(@chocolate).not_to eq(nil)
    expect(@pollo).not_to eq(nil)
    expect(@queso).not_to eq(nil)
   end
  
  it "Nombre del alimento" do
    expect( @chocolate.identificador ).to eq("El alimento es: chocolate")
    expect( @pollo.identificador ).to eq("El alimento es: pollo")
    expect( @queso.identificador ).to eq("El alimento es: queso")
  end

  it "emisiones de gases de efecto invernadero" do
    expect( @chocolate.emisiones ).to eq("Las emisiones son de: #{2.3} kgCO^2eq")
    expect( @pollo.emisiones ).to eq("Las emisiones son de: #{5.7} kgCO^2eq")
    expect( @queso.emisiones ).to eq("Las emisiones son de: #{11.0} kgCO^2eq")
  end

  it "Terreno utilizado" do
    expect( @chocolate.terreno ).to eq("El terreno utilizado es de: #{3.4} m^2/año")
    expect( @pollo.terreno ).to eq("El terreno utilizado es de: #{7.1} m^2/año")
    expect( @queso.terreno ).to eq("El terreno utilizado es de: #{41.0} m^2/año")
  end

  it "Alimento to_s" do
    expect( @chocolate.to_s ).to eq("chocolate: proteínas #{5.3}, carbohidratos #{47.0}, lípidos #{30.0}, emisiones #{2.3}, terreno #{3.4}")
    expect( @pollo.to_s ).to eq("pollo: proteínas #{20.6}, carbohidratos #{0.0}, lípidos #{5.6}, emisiones #{5.7}, terreno #{7.1}")
    expect( @queso.to_s ).to eq("queso: proteínas #{25.0}, carbohidratos #{1.3}, lípidos #{33.0}, emisiones #{11.0}, terreno #{41.0}")
  end

  it "Valor Energético de un alimento" do
    expect( @chocolate.valorEnergetico ).to eq(479.2)
    expect( @pollo.valorEnergetico ).to eq(132.8)
    expect( @queso.valorEnergetico ).to eq(402.2)
  end

  it "Impacto Ambiental diario de un hombre 20-39" do
    expect( impactoAmbientalHombre( @alimentos ) ).to eq("Con este menú obtiene el #{91}% CDR Kcal, y proteinas #{54.2}g/54g con una emisión de #{13.7}KgCO2eq")
  end

  it "Impacto Ambiental diario de una mujer 20-39" do
    expect( impactoAmbientalMujer( @alimentos2 ) ).to eq("Con este menú obtiene el #{94}% CDR Kcal, y proteinas #{40}g/41g con una emisión de #{10.64}KgCO2eq")
  end

  
  describe "Práctica 7" do
    before :each do
      # @chocolate = Alimento.new( "chocolate", 5.3, 47.0, 30.0, 2.3, 3.4 )
      # @pollo = Alimento.new( "pollo", 20.6, 0.0, 5.6, 5.7, 7.1 )
      # @queso = Alimento.new( "queso",  25.0, 1.3, 33.0, 11.0, 41.0 )
      # @tofu = Alimento.new( "tofu", 8.0, 1.9, 4.8, 2.0, 2.2 )
      # @carne_vaca = Alimento.new( "carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.0 )
      # @cerveza = Alimento.new( "cerveza",  0.5, 3.6, 0.0, 0.24, 0.22 )
      # @carne_cordero = Alimento.new( "carne de cordero",  18.0, 0.0, 17.0, 20.0, 185.0 )
      # @salmon = Alimento.new( "salmón", 19.9, 0.0, 13.6, 6.0, 3.7 )
      # @lentejas = Alimento.new( "lentejas", 23.5, 52.0, 1.4, 0.4, 3.4 )
      # @nuez = Alimento.new( "nuez",  20.0, 21.0, 54.0, 0.3, 7.9 )
      # @leche_vaca = Alimento.new( "leche de vaca", 3.3, 4.8, 3.2, 3.2, 8.9 )
      # @huevos = Alimento.new( "huevos",  13.0, 1.1, 11.0, 4.2, 5.7 )
      # @camarones = Alimento.new( "camarones", 17.6, 1.5, 0.6, 18.0, 2.0 )
      # @cerdo = Alimento.new( "cerdo", 21.5, 0.0, 6.3, 7.6, 11.0 )
      # @cafe = Alimento.new( "café", 0.1, 0.0, 0.0, 0.4, 0.3 )

      @lista1 = Lista.new()
      @lista2 = Lista.new()
      @españolaH = Lista.new( [ @chocolate, @pollo, @queso, @lentejas, @nuez, @chocolate] )
      @españolaM = Lista.new( [ @chocolate, @lentejas, @nuez, @queso, @cerveza, @tofu, @huevos, @cerveza ] )
      @vascaH = Lista.new( [ @lentejas, @lentejas, @lentejas, @chocolate, @chocolate, @leche_vaca, @leche_vaca, @chocolate, @chocolate] )
      @vascaM = Lista.new( [ @lentejas, @chocolate, @chocolate, @leche_vaca, @chocolate, @chocolate] )
      @vegetariaH = Lista.new( [ @leche_vaca, @leche_vaca, @leche_vaca, @huevos, @chocolate, @chocolate, @leche_vaca, @chocolate, @huevos, @huevos, @tofu, @leche_vaca, @leche_vaca, @leche_vaca, @leche_vaca, @leche_vaca, @huevos, @huevos ] )
      @vegetariaM = Lista.new( [ @leche_vaca, @leche_vaca, @leche_vaca, @huevos, @chocolate, @leche_vaca, @chocolate, @huevos, @huevos, @leche_vaca, @leche_vaca, @leche_vaca, @leche_vaca, @leche_vaca, @leche_vaca, @leche_vaca, @huevos ] )
      @vegetalianaH = Lista.new( [ @chocolate, @chocolate, @chocolate, @nuez, @tofu, @nuez, @tofu ] ) 
      @vegetalianaM = Lista.new( [ @chocolate, @nuez, @tofu, @nuez, @tofu, @lentejas ] )
      @locuraCarneH = Lista.new( [ @pollo, @cerdo, @carne_cordero, @carne_vaca, @nuez, @chocolate, @cerdo, @nuez, @queso ] )
      @locuraCarneM = Lista.new( [ @pollo, @cerdo, @carne_cordero, @carne_vaca, @nuez, @nuez, @queso ] )

      def dietaPorcentajeHombre( dietaLista )
      
        cdr = 0
        proteinas = 0
        grasas = 0
        carbohidratos = 0
        total = 0
        nodoAux = dietaLista.cabeza
        if (dietaLista.tamaño == 0)
          return "Lista Vacía"
        else
        while(nodoAux != nil)                
          cdr += nodoAux["value"].valorEnergetico()
          proteinas += nodoAux["value"].proteinas()
          grasas += nodoAux["value"].lipidos()
          carbohidratos += nodoAux["value"].carbohidratos()
          nodoAux = nodoAux["next"]
        end
        total += (proteinas + grasas + carbohidratos)
        cdr = (cdr/30.0).round
        return "#{cdr}%CDR, #{( ( carbohidratos * 100 ) / total ).round}% carbohidratos, #{( ( grasas * 100 ) / total ).round}% grasas, #{( ( proteinas * 100 ) / total ).round}% proteínas"
        end
      end

      def dietaPorcentajeMujer( dietaLista )
      
        cdr = 0
        proteinas = 0
        grasas = 0
        carbohidratos = 0
        total = 0
        nodoAux = dietaLista.cabeza
        if (dietaLista.tamaño == 0)
          return "Lista Vacía"
        else
        while(nodoAux != nil)                
          cdr += nodoAux["value"].valorEnergetico()
          proteinas += nodoAux["value"].proteinas()
          grasas += nodoAux["value"].lipidos()
          carbohidratos += nodoAux["value"].carbohidratos()
          nodoAux = nodoAux["next"]
        end
        total += (proteinas + grasas + carbohidratos)
        cdr = (cdr/23.0).round
        return "#{cdr}%CDR, #{( ( carbohidratos * 100 ) / total ).round}% carbohidratos, #{( ( grasas * 100 ) / total ).round}% grasas, #{( ( proteinas * 100 ) / total ).round}% proteínas"
        end
      end

      def dietaEmisionesDiarias( dietaLista )
        
        gases = 0
        nodoAux = dietaLista.cabeza
        if (dietaLista.tamaño == 0)
          return "Lista Vacía"
        else
        while(nodoAux != nil)                
          gases += nodoAux["value"].gasEfectoInv()
          nodoAux = nodoAux["next"]
        end
        return "#{gases.round}kg CO2eq diario"
        end
      end

      def dietaEmisionesAnual( dietaLista )
        
        gases = 0
        nodoAux = dietaLista.cabeza
        if (dietaLista.tamaño == 0)
          return "Lista Vacía"
        else
        while(nodoAux != nil)                
          gases += nodoAux["value"].gasEfectoInv()
          nodoAux = nodoAux["next"]
        end
        return "#{gases.round * 365}kg CO2eq anual"
        end
      end

      def dietaMetrosCuadrados( dietaLista )
        
        metros = 0
        nodoAux = dietaLista.cabeza
        if (dietaLista.tamaño == 0)
          return "Lista Vacía"
        else
        while(nodoAux != nil)                
          metros += nodoAux["value"].terrenoAño()
          nodoAux = nodoAux["next"]
        end
        return "#{metros.round}m2/año"
        end
      end

    end

    it "Creación de un método Lista" do
      expect( @lista1 ).not_to eq( nil )
      expect( @chocolate ).not_to eq( nil )
    end

    it "Lista vacía" do
      expect( @lista1.is_empty? ).to eq( true )
      expect( @lista2.is_empty? ).to eq( true )
    end

    it "Insertar adelante" do
      @lista1.insertaAdelante( @carne_vaca )
      @lista1.insertaAdelante( @tofu )
      @lista1.insertaAdelante( @queso )
      @lista1.insertaAdelante( @pollo )
      @lista1.insertaAdelante( @chocolate )
      expect( @lista1.cabeza.prev ).to eq( nil )
      expect( @lista1.cabeza.value ).to eq( @chocolate )
      expect( @lista1.cabeza.next.value ).to eq( @pollo )
      expect( @lista1.tamaño ).to eq( 5 )
    end

    it "Insertar Atrás" do
      @lista1.insertaAtras( @chocolate )
      @lista1.insertaAtras( @pollo )
      @lista1.insertaAtras( @queso )
      @lista1.insertaAtras( @tofu )
      @lista1.insertaAtras( @carne_vaca )
      expect(@lista1.cola.value).to eq( @carne_vaca )
      expect(@lista1.cola.prev.value).to eq( @tofu )
      expect(@lista1.tamaño).to eq( 5 )
    end 

    it "Extraer por delante" do
      expect(@lista1.extraerDelante).to eq("Lista Vacía")
      @lista1.insertaAdelante( @queso )
      @lista1.insertaAdelante( @pollo )
      @lista1.insertaAdelante( @chocolate )
      @lista1.insertaAtras( @tofu )
      @lista1.insertaAtras( @carne_vaca )
      @lista1.insertaAtras( @cerveza )
      expect(@lista1.extraerDelante).to eq( @chocolate )
      expect(@lista1.cabeza.next.value).to eq( @queso )
      expect(@lista1.tamaño).to eq( 5 )
    end

    it "Extraer por detrás" do
      expect(@lista1.extraerDetras).to eq("Lista Vacía")
      @lista1.insertaAdelante( @queso )
      @lista1.insertaAdelante( @pollo )
      @lista1.insertaAdelante( @chocolate )
      @lista1.insertaAtras( @tofu )
      @lista1.insertaAtras( @carne_vaca )
      @lista1.insertaAtras( @cerveza )
      expect(@lista1.extraerDetras).to eq( @cerveza )
      expect(@lista1.cola.value).to eq( @carne_vaca )
      expect(@lista1.tamaño).to eq( 5 )
    end

    it "Lista de alimentos dieta española y la vasca" do
      # la española ( 40 % de carbohidratos, 40 % de grasas, 20 % de proteı́nas )
      # la vasca ( 60 % de carbohidratos, 25 % de grasas, 15 % de proteı́nas )
      expect( dietaPorcentajeHombre( @españolaH ) ).to eq( "#{82}%CDR, #{40}% carbohidratos, #{36}% grasas, #{24}% proteínas" )
      expect( dietaPorcentajeMujer( @españolaM ) ).to eq( "#{92}%CDR, #{36}% carbohidratos, #{37}% grasas, #{27}% proteínas" )
      expect( dietaEmisionesDiarias( @españolaH ) ).to eq( "#{22}kg CO2eq diario" )
      expect( dietaEmisionesAnual( @españolaM ) ).to eq( "#{7665}kg CO2eq anual" )
      expect( dietaMetrosCuadrados( @españolaM ) ).to eq( "#{64}m2/año" )
      expect( dietaPorcentajeHombre( @vascaH ) ).to eq( "#{99}%CDR, #{61}% carbohidratos, #{22}% grasas, #{17}% proteínas" )
      expect( dietaPorcentajeMujer( @vascaM ) ).to eq( "#{100}%CDR, #{59}% carbohidratos, #{30}% grasas, #{11}% proteínas" )
      expect( dietaEmisionesDiarias( @vascaH ) ).to eq( "#{17}kg CO2eq diario" )
      expect( dietaEmisionesAnual( @vascaM ) ).to eq( "#{4745}kg CO2eq anual" )
      expect( dietaMetrosCuadrados( @vascaM ) ).to eq( "#{26}m2/año" ) 
    end

    it "Lista de alimentos dieta vegetaria y vegetaliana" do
      # la vegetaria ( 40 % de carbohidratos, 40 % de grasas, 20 % de proteı́nas )
      # la vegetaliana ( 60 % de carbohidratos, 25 % de grasas, 15 % de proteı́nas )
      expect( dietaPorcentajeHombre( @vegetariaH ) ).to eq( "#{95}%CDR, #{39}% carbohidratos, #{37}% grasas, #{24}% proteínas" )
      expect( dietaPorcentajeMujer( @vegetariaM ) ).to eq( "#{98}%CDR, #{39}% carbohidratos, #{36}% grasas, #{25}% proteínas" )
      expect( dietaEmisionesDiarias( @vegetariaH ) ).to eq( "#{59}kg CO2eq diario" )
      expect( dietaEmisionesAnual( @vegetariaM ) ).to eq( "#{20805}kg CO2eq anual" )
      expect( dietaMetrosCuadrados( @vegetariaM ) ).to eq( "#{128}m2/año" )
      expect( dietaPorcentajeHombre( @vegetalianaH ) ).to eq( "#{97}%CDR, #{40}% carbohidratos, #{45}% grasas, #{15}% proteínas" )
      expect( dietaPorcentajeMujer( @vegetalianaM ) ).to eq( "#{98}%CDR, #{38}% carbohidratos, #{39}% grasas, #{22}% proteínas" )
      expect( dietaEmisionesDiarias( @vegetalianaH ) ).to eq( "#{12}kg CO2eq diario" )
      expect( dietaEmisionesAnual( @vegetalianaM ) ).to eq( "#{2555}kg CO2eq anual" )
      expect( dietaMetrosCuadrados( @vegetalianaM ) ).to eq( "#{27}m2/año" )
    end

    it "Lista de la locura por la carne" do
      # consumo de carne del 50% 
      expect( dietaPorcentajeHombre( @locuraCarneH ) ).to eq( "#{98}%CDR, #{19}% carbohidratos, #{44}% grasas, #{37}% proteínas" )
      expect( dietaPorcentajeMujer( @locuraCarneM ) ).to eq( "#{101}%CDR, #{12}% carbohidratos, #{48}% grasas, #{40}% proteínas" )
      expect( dietaEmisionesDiarias( @locuraCarneH ) ).to eq( "#{105}kg CO2eq diario" )
      expect( dietaEmisionesAnual( @locuraCarneM ) ).to eq( "#{34675}kg CO2eq anual" )
      expect( dietaMetrosCuadrados( @locuraCarneM ) ).to eq( "#{424}m2/año" )
    end
  end

  describe "Práctica 8" do
    before :each do
      @españolaM = Lista.new( [ @chocolate, @lentejas, @nuez, @queso, @cerveza, @tofu, @huevos, @cerveza ] )
      @plato1 = Plato.new( "Ternera con salsa de queso", [ @carne_vaca, @nuez, @queso ], [ 100, 50, 32 ] )
      @plato2 = PlatoAmbiental.new( "Lasaña de de pollo", [ @pollo, @queso, @huevos, @leche_vaca], [ 200, 100, 75, 300 ] )
    end

    it "Comparar dos alimentos" do
      expect( @carne_vaca < @cafe ).to eq( false )
      expect( @carne_vaca > @cafe ).to eq( true )
      expect( @carne_vaca >= @cafe ).to eq( true )
      expect( @carne_vaca <= @cafe ).to eq( false )
      expect( @carne_vaca == @cafe ).to eq( false )
    end

    it "Listas enumerables" do
      expect( @españolaM.collect { | alimento | alimento.nombre + "_alimento" } ).to eq( [ "chocolate_alimento",  "lentejas_alimento",  "nuez_alimento",  "queso_alimento",  "cerveza_alimento",  "tofu_alimento",  "huevos_alimento",  "cerveza_alimento" ] )
      expect( @españolaM.select{ | alimento | alimento.carbohidratos > 10 } ).to eq([ @chocolate, @lentejas, @nuez] )
      expect( @españolaM.max ).to eq( @nuez )
      expect( @españolaM.min).to eq( @cerveza )
      expect( @españolaM.sort ).to eq( [ @cerveza, @cerveza, @tofu, @huevos, @lentejas, @queso, @chocolate, @nuez ] )
    end

    it "Clase Plato Energético" do
      expect( @plato1 ).not_to eq( nil )
      expect( @plato1.nombre ).to eq( "Ternera con salsa de queso" )
      expect( @plato1.listaAlimentos.to_s ).to eq( Lista.new( [ @carne_vaca, @nuez, @queso ] ).to_s )
      expect( @plato1.listaGramos.to_s ).to eq(  Lista.new( [ 100, 50, 32  ] ).to_s )
      expect( @plato1.vct ).to eq( 566 )
      expect( @plato1.porcenProteinas ).to eq( 21 )
      expect( @plato1.porcenLipidos ).to eq( 22 )
      expect( @plato1.porcenHidratos ).to eq( 6 )
      expect( @plato1.to_s ).to eq( "Ternera con salsa de queso: proteinas = #{21}%, lipidos = #{22}%, hidratos = #{6}%, vct = #{566}Kcal" )     
    end

    it "Clase Plato Ambiental y pruebas de tipo" do

      expect( @plato2 ).not_to eq( nil )
      expect( @plato2.emisionesDiarias ).to eq( 35 )
      expect( @plato2.metrosUsoTerreno ).to eq( 86 )
      expect( @plato2.eficienciaEnergetica ).to eq( "EficienciaEnergética -> Lasaña de de pollo: #{35}kgCO2eq, #{86}Terreno m^2/año" )
      expect( @plato1.is_a?( PlatoAmbiental ) ).not_to eq( true )
      expect( @plato2.instance_of?( PlatoAmbiental ) ).to eq( true )
      expect( @plato2.class.ancestors ).to eq( [ PlatoAmbiental, Plato, Object, Kernel, BasicObject ] )
      expect( @plato2 ).to be_a_kind_of( PlatoAmbiental )
    end
  end
end

RSpec.describe Prct06Tdd do
  it "has a version number" do
    expect(Prct06Tdd::VERSION).not_to be nil
  end

  describe Alimento do
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
    
    end
    context "Creamos la clase Alimento" do
      it "No nulo genérico" do
        expect( Alimento.new() ).not_to eq( nil )
      end
    end

    context "Creamos los alimentos de manera correcta" do
      it "chocolate no nulo" do
        expect( @chocolate ).not_to eq( nil )
      end
      it "pollo no nulo" do
        expect( @pollo ).not_to eq( nil )
      end
      it "queso no nulo" do
        expect( @queso ).not_to eq( nil )
      end
    end
    
    context "Nombre del alimento" do
      it "nombre chocolate" do
        expect( @chocolate.identificador ).to eq("El alimento es: chocolate")
      end
      it "nombre pollo" do
        expect( @pollo.identificador ).to eq("El alimento es: pollo")
      end
      it "nombre queso" do
        expect( @queso.identificador ).to eq("El alimento es: queso")
      end
    end

    context "Emisiones de gases de efecto invernadero" do
      it "Emisiones del chocolate" do
        expect( @chocolate.emisiones ).to eq("Las emisiones son de: #{2.3} kgCO^2eq")
      end
      it "Emisiones del pollo" do
        expect( @pollo.emisiones ).to eq("Las emisiones son de: #{5.7} kgCO^2eq")
      end
      it "emisiones del queso" do
        expect( @queso.emisiones ).to eq("Las emisiones son de: #{11.0} kgCO^2eq")
      end
    end

    context "Terreno utilizado" do
      it "Terreno usado por el chocolate" do
        expect( @chocolate.terreno ).to eq("El terreno utilizado es de: #{3.4} m^2/año")
      end
      it "Terreno usado por el pollo" do
        expect( @pollo.terreno ).to eq("El terreno utilizado es de: #{7.1} m^2/año")
      end
      it "Terreno usado por el queso" do
        expect( @queso.terreno ).to eq("El terreno utilizado es de: #{41.0} m^2/año")
      end
    end

    context "Salida de alimento formateado" do
      it "chocolate to_s" do
        expect( @chocolate.to_s ).to eq("chocolate: proteínas #{5.3}, carbohidratos #{47.0}, lípidos #{30.0}, emisiones #{2.3}, terreno #{3.4}")
      end
      it "pollo to_s" do
        expect( @pollo.to_s ).to eq("pollo: proteínas #{20.6}, carbohidratos #{0.0}, lípidos #{5.6}, emisiones #{5.7}, terreno #{7.1}")
      end
      it "queso to_s" do
        expect( @queso.to_s ).to eq("queso: proteínas #{25.0}, carbohidratos #{1.3}, lípidos #{33.0}, emisiones #{11.0}, terreno #{41.0}")
      end
    end

    context "Obtener el valor Energético de un alimento" do
      it "Valor energético del chocolate" do
        expect( @chocolate.valorEnergetico ).to eq(479.2)
      end
      it "Valor energético del pollo" do
        expect( @pollo.valorEnergetico ).to eq(132.8)
      end
      it "Valor energético del queso" do
        expect( @queso.valorEnergetico ).to eq(402.2)
      end
    end

    context "Impacto Ambiental diario" do      
      it "Impacto Ambiental diario de un hombre 20-39" do
        @alimentos = [ @chocolate, @chocolate, @chocolate, @chocolate, @nuez, @huevos ]
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

        expect( impactoAmbientalHombre( @alimentos ) ).to eq("Con este menú obtiene el #{91}% CDR Kcal, y proteinas #{54.2}g/54g con una emisión de #{13.7}KgCO2eq")
      end

      it "Impacto Ambiental diario de una mujer 20-39" do
        @alimentos2 = [ @chocolate, @chocolate, @chocolate, @nuez, @cerveza, @leche_vaca ]
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

        expect( impactoAmbientalMujer( @alimentos2 ) ).to eq("Con este menú obtiene el #{94}% CDR Kcal, y proteinas #{40}g/41g con una emisión de #{10.64}KgCO2eq")
      end
    end

    
    describe Lista do
      before :each do

        @lista1 = Lista.new()
        @lista2 = Lista.new()

      end
      
      context "Creación de una Clase Lista" do
        it "Lista no vacía" do
          expect( @lista1 ).not_to eq( nil )
          expect( @chocolate ).not_to eq( nil )
        end

        it "Método is_empty? funcionando" do
          expect( @lista1.is_empty? ).to eq( true )
          expect( @lista2.is_empty? ).to eq( true )
        end
      end

      context "Añadiendo elementos a Lista" do
        it "Método Inserta Adelante" do
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

        it "Método Inserta Atrás" do
          @lista1.insertaAtras( @chocolate )
          @lista1.insertaAtras( @pollo )
          @lista1.insertaAtras( @queso )
          @lista1.insertaAtras( @tofu )
          @lista1.insertaAtras( @carne_vaca )
          expect(@lista1.cola.value).to eq( @carne_vaca )
          expect(@lista1.cola.prev.value).to eq( @tofu )
          expect(@lista1.tamaño).to eq( 5 )
        end
      end

      context "Extrayendo elementos a Lista" do
        it "Método extraer por delante" do
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

        it "Método extraer por detrás" do
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
      end

      context "Creación de Dietas y comprobación de porcentajes, emisiones y terreno" do
        before :each do

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

        it "Lista de alimentos dieta española y la vasca" do
          
          @españolaH = Lista.new( [ @chocolate, @pollo, @queso, @lentejas, @nuez, @chocolate] )
          @españolaM = Lista.new( [ @chocolate, @lentejas, @nuez, @queso, @cerveza, @tofu, @huevos, @cerveza ] )
          @vascaH = Lista.new( [ @lentejas, @lentejas, @lentejas, @chocolate, @chocolate, @leche_vaca, @leche_vaca, @chocolate, @chocolate] )
          @vascaM = Lista.new( [ @lentejas, @chocolate, @chocolate, @leche_vaca, @chocolate, @chocolate] )

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

          @vegetariaH = Lista.new( [ @leche_vaca, @leche_vaca, @leche_vaca, @huevos, @chocolate, @chocolate, @leche_vaca, @chocolate, @huevos, @huevos, @tofu, @leche_vaca, @leche_vaca, @leche_vaca, @leche_vaca, @leche_vaca, @huevos, @huevos ] )
          @vegetariaM = Lista.new( [ @leche_vaca, @leche_vaca, @leche_vaca, @huevos, @chocolate, @leche_vaca, @chocolate, @huevos, @huevos, @leche_vaca, @leche_vaca, @leche_vaca, @leche_vaca, @leche_vaca, @leche_vaca, @leche_vaca, @huevos ] )
          @vegetalianaH = Lista.new( [ @chocolate, @chocolate, @chocolate, @nuez, @tofu, @nuez, @tofu ] ) 
          @vegetalianaM = Lista.new( [ @chocolate, @nuez, @tofu, @nuez, @tofu, @lentejas ] )
          
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

          @locuraCarneH = Lista.new( [ @pollo, @cerdo, @carne_cordero, @carne_vaca, @nuez, @chocolate, @cerdo, @nuez, @queso ] )
          @locuraCarneM = Lista.new( [ @pollo, @cerdo, @carne_cordero, @carne_vaca, @nuez, @nuez, @queso ] )

          expect( dietaPorcentajeHombre( @locuraCarneH ) ).to eq( "#{98}%CDR, #{19}% carbohidratos, #{44}% grasas, #{37}% proteínas" )
          expect( dietaPorcentajeMujer( @locuraCarneM ) ).to eq( "#{101}%CDR, #{12}% carbohidratos, #{48}% grasas, #{40}% proteínas" )
          expect( dietaEmisionesDiarias( @locuraCarneH ) ).to eq( "#{105}kg CO2eq diario" )
          expect( dietaEmisionesAnual( @locuraCarneM ) ).to eq( "#{34675}kg CO2eq anual" )
          expect( dietaMetrosCuadrados( @locuraCarneM ) ).to eq( "#{424}m2/año" )
        end
      end
    end

    describe Plato do
      before :each do
        @españolaM = Lista.new( [ @chocolate, @lentejas, @nuez, @queso, @cerveza, @tofu, @huevos, @cerveza ] )
        @plato1 = Plato.new( "Ternera con salsa de queso", [ @carne_vaca, @nuez, @queso ], [ 100, 50, 32 ] )
        @plato2 = PlatoAmbiental.new( "Lasaña de de pollo", [ @pollo, @queso, @huevos, @leche_vaca], [ 200, 100, 75, 300 ] )
      end

      context "Comparar dos alimentos" do
        it "<" do
          expect( @carne_vaca < @cafe ).to eq( false )
        end
        it ">" do
          expect( @carne_vaca > @cafe ).to eq( true )
        end
        it ">=" do
          expect( @carne_vaca >= @cafe ).to eq( true )
        end
        it "<=" do
          expect( @carne_vaca <= @cafe ).to eq( false )
        end
        it "==" do
          expect( @carne_vaca == @cafe ).to eq( false )
        end
      end

      context "Clase Lista añadido el módulo Enumerable" do
        it "método collect" do
        expect( @españolaM.collect { | alimento | alimento.nombre + "_alimento" } ).to eq( [ "chocolate_alimento",  "lentejas_alimento",  "nuez_alimento",  "queso_alimento",  "cerveza_alimento",  "tofu_alimento",  "huevos_alimento",  "cerveza_alimento" ] )
        end
        it "método select" do
        expect( @españolaM.select{ | alimento | alimento.carbohidratos > 10 } ).to eq([ @chocolate, @lentejas, @nuez] )
        end
        it "método max" do
        expect( @españolaM.max ).to eq( @nuez )
        end
        it "método min" do
        expect( @españolaM.min).to eq( @cerveza )
        end
        it "método sort" do
        expect( @españolaM.sort ).to eq( [ @cerveza, @cerveza, @tofu, @huevos, @lentejas, @queso, @chocolate, @nuez ] )
        end
      end

      context "Creamos La clase Plato" do
        it "Plato no nulo" do
          expect( @plato1 ).not_to eq( nil )
        end
        it "Plato atributo nombre" do
          expect( @plato1.nombre ).to eq( "Ternera con salsa de queso" )
        end
        it "Plato atributo listaAlimentos" do
          expect( @plato1.listaAlimentos.to_s ).to eq( Lista.new( [ @carne_vaca, @nuez, @queso ] ).to_s )
        end
        it "Plato atributo listaGramos" do
          expect( @plato1.listaGramos.to_s ).to eq(  Lista.new( [ 100, 50, 32  ] ).to_s )
        end
        it "Plato atributo vct(Valor Calorico Total)" do
          expect( @plato1.vct ).to eq( 566 )
        end
        it "Plato atributo porcentaje de proteinas" do
          expect( @plato1.porcenProteinas ).to eq( 21 )
        end
        it "Plato atributo porcentaje de lípidos" do
          expect( @plato1.porcenLipidos ).to eq( 22 )
        end
        it "Plato atributo porcentaje de hidratos" do
          expect( @plato1.porcenHidratos ).to eq( 6 )
        end
        it "Plato salida formateada (to_s)" do
          expect( @plato1.to_s ).to eq( "Ternera con salsa de queso: proteinas = #{21}%, lipidos = #{22}%, hidratos = #{6}%, vct = #{566}Kcal" )     
        end
      end

      context "Clase Plato Ambiental y pruebas de jerarquía" do
        it "Clase Plato Ambiental funcionando" do
          expect( @plato2 ).not_to eq( nil )
          expect( @plato2.emisionesDiarias ).to eq( 35 )
          expect( @plato2.metrosUsoTerreno ).to eq( 86 )
          expect( @plato2.eficienciaEnergetica ).to eq( "EficienciaEnergética -> Lasaña de de pollo: #{35}kgCO2eq, #{86}Terreno m^2/año" )
        end
          it "Pruebas de jerarquía" do
          expect( @plato1.is_a?( PlatoAmbiental ) ).not_to eq( true )
          expect( @plato2.instance_of?( PlatoAmbiental ) ).to eq( true )
          expect( @plato2.class.ancestors ).to eq( [ PlatoAmbiental, Plato, Comparable, Object, Kernel, BasicObject ] )
          expect( @plato2 ).to be_a_kind_of( PlatoAmbiental )
        end
      end

      context "Platos de diferentes tipos comparables y diferentes métodos de dietas realizables" do
        before :each do
          @chocolateALaTaza = Plato.new( "Chocolate a la taza", [ @chocolate, @nuez, @leche_vaca ] , [ 300, 100, 500 ] )
          @PotajeDeLentejas = PlatoAmbiental.new( "Potaje de Lentejas", [ @lentejas, @queso, @pollo ], [240, 30, 65 ] )
          @MenuEspañol = PlatoAmbiental.new( "Almuerzo Continental", [ @cerdo, @huevos, @cafe, @chocolate], [ 190, 160, 35, 80] )
          @polloALaCerveza = Plato.new( "Pollo a la Cerveza", [ @pollo, @cerveza, @tofu ], [ 220, 240, 35 ] )
          @LentejasEstofadas = Plato.new( "Lentejas Estofadas", [ @lentejas, @cerdo ], [ 210, 100 ] )
          @Tiramisu = PlatoAmbiental.new( "Tiramisu", [ @chocolate, @cafe, @leche_vaca, @huevos ], [ 500, 250, 125, 100 ] )
          @BizcochoDeNueces = Plato.new( "Bizcocho de Nueces", [ @nuez, @leche_vaca, @huevos ], [ 50, 600, 400 ] )
          @MousseDeCafe = PlatoAmbiental.new( "Mousse de Café", [ @leche_vaca, @huevos, @cafe ], [ 400, 360, 210 ] )
          @HamburguesaLentejas = PlatoAmbiental.new( "Hamburguesa de lentejas", [ @huevos, @lentejas ], [ 200, 300 ] )
          @cerdoSalsaDeQueso = Plato.new( "Cerdo en salsa de queso", [ @cerdo, @leche_vaca, @queso ], [ 400, 160, 70 ] )
          @ensaladaDeSalmon = Plato.new( "Ensalada de salmón", [ @salmon , @tofu , @huevos, @queso ], [ 235, 164, 88, 71 ] )
          @CorderoAlHorno = PlatoAmbiental.new( "Cordero Al horno", [ @carne_cordero, @cerveza], [ 500, 216 ] )

          @PlatosDietaEspañola = Lista.new( [ @PotajeDeLentejas, @MenuEspañol, @polloALaCerveza, @chocolateALaTaza ] )
          @PlatosDietaVasca = Lista.new( [ @LentejasEstofadas, @Tiramisu, @ensaladaDeSalmon, @CorderoAlHorno ] )
          @PlatosDietaVegetaria = Lista.new( [ @Tiramisu, @BizcochoDeNueces, @MousseDeCafe, @BizcochoDeNueces ] )
          @PlatosDietaVegetaliana = Lista.new( [ @Tiramisu, @HamburguesaLentejas, @chocolateALaTaza, @MousseDeCafe ] )
          @PlatosDietaLocuraCarne = Lista.new( [ @CorderoAlHorno, @cerdoSalsaDeQueso, @ensaladaDeSalmon, @chocolateALaTaza ] )
        end
        it "Platos de diferentes tipos comparables" do
          expect( @plato1 < @plato2 ).to eq( true )
        end
        it "Dieta con collect funcionando" do
          expect( @PlatosDietaEspañola.collect { | plato | "Plato " + plato.nombre  } ).to eq( [ "Plato Potaje de Lentejas", "Plato Almuerzo Continental", "Plato Pollo a la Cerveza", "Plato Chocolate a la taza" ] )
        end
        it "Dieta con select funcionando" do
          expect( @PlatosDietaVegetaria.select { | plato | plato.vct  > 100 } ).to eq( [ @Tiramisu, @BizcochoDeNueces, @MousseDeCafe, @BizcochoDeNueces ] )
        end
        it "Dieta con max funcionando" do
          expect( @PlatosDietaVegetaria.max ).to eq( @Tiramisu )
        end
        it "Dieta con min funcionando" do
          expect( @PlatosDietaVasca.min ).to eq( @LentejasEstofadas )
        end
        it "Dieta con sort funcionando" do
          expect( @PlatosDietaVegetaria.sort ).to eq( [ @MousseDeCafe, @BizcochoDeNueces, @BizcochoDeNueces, @Tiramisu ] )
        end
      end
    end
  end
end

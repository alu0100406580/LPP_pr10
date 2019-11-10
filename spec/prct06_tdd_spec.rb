RSpec.describe Prct06Tdd do
  it "has a version number" do
    expect(Prct06Tdd::VERSION).not_to be nil
  end

  before :each do
    @alimento1 = Alimento.new("chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
    @alimento2 = Alimento.new("pollo", 20.6, 0.0, 5.6, 5.7, 7.1)
    @alimento3 = Alimento.new("queso",  25.0, 1.3, 33.0, 11.0, 41.0)
  end

  it "Creamos la clase Alimento" do
    expect( Alimento.new() ).not_to eq( nil )
  end

  it "Creamos los alimentos de manera correcta" do
    expect(@alimento1).not_to eq(nil)
    expect(@alimento2).not_to eq(nil)
    expect(@alimento3).not_to eq(nil)
   end
  
  it "Nombre del alimento" do
    expect( @alimento1.identificador ).to eq("El alimento es: chocolate")
    expect( @alimento2.identificador ).to eq("El alimento es: pollo")
    expect( @alimento3.identificador ).to eq("El alimento es: queso")
  end

  it "emisiones de gases de efecto invernadero" do
    expect( @alimento1.emisiones ).to eq("Las emisiones son de: #{2.3} kgCO^2eq")
    expect( @alimento2.emisiones ).to eq("Las emisiones son de: #{5.7} kgCO^2eq")
    expect( @alimento3.emisiones ).to eq("Las emisiones son de: #{11.0} kgCO^2eq")
  end

  it "Terreno utilizado" do
    expect( @alimento1.terreno ).to eq("El terreno utilizado es de: #{3.4} m^2/año")
    expect( @alimento2.terreno ).to eq("El terreno utilizado es de: #{7.1} m^2/año")
    expect( @alimento3.terreno ).to eq("El terreno utilizado es de: #{41.0} m^2/año")
  end

  it "Alimento to_s" do
    expect( @alimento1.to_s ).to eq("chocolate: proteínas #{5.3}, carbohidratos #{47.0}, lípidos #{30.0}, emisiones #{2.3}, terreno #{3.4}")
    expect( @alimento2.to_s ).to eq("pollo: proteínas #{20.6}, carbohidratos #{0.0}, lípidos #{5.6}, emisiones #{5.7}, terreno #{7.1}")
    expect( @alimento3.to_s ).to eq("queso: proteínas #{25.0}, carbohidratos #{1.3}, lípidos #{33.0}, emisiones #{11.0}, terreno #{41.0}")
  end

  it "Valor Energético de un alimento" do
    expect( @alimento1.valorEnergetico ).to eq(479.2)
    expect( @alimento2.valorEnergetico ).to eq(132.8)
    expect( @alimento3.valorEnergetico ).to eq(402.2)
  end

  it "Impacto Ambiental diario de un hombre 20-39" do
    expect( @alimento1.impactoAmbientalHombre ).to eq("#{16}% CDR Kcal, y proteinas #{5.3}g/54g")
    expect( @alimento2.impactoAmbientalHombre ).to eq("#{4}% CDR Kcal, y proteinas #{20.6}g/54g")
    expect( @alimento3.impactoAmbientalHombre ).to eq("#{13}% CDR Kcal, y proteinas #{25.0}g/54g")
  end

  it "Impacto Ambiental diario de una mujer 20-39" do
    expect( @alimento1.impactoAmbientalMujer ).to eq("#{21}% CDR Kcal, y proteinas #{5.3}g/41g")
    expect( @alimento2.impactoAmbientalMujer ).to eq("#{6}% CDR Kcal, y proteinas #{20.6}g/41g")
    expect( @alimento3.impactoAmbientalMujer ).to eq("#{17}% CDR Kcal, y proteinas #{25.0}g/41g")
  end
end

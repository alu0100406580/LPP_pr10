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
end

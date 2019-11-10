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
    puts @alimento1.nombre
  end
end

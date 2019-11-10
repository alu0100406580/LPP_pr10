RSpec.describe Prct06Tdd do
  it "has a version number" do
    expect(Prct06Tdd::VERSION).not_to be nil
  end

  before :each do
    @chocolate = Alimento.new( 5.3, 47.0, 30.0, 2.3, 3.4)
    @pollo = Alimento.new( 20.6, 0.0, 5.6, 5.7, 7.1)
    @queso = Alimento.new( 25.0, 1.3, 33.0, 11.0, 41.0)
  end

  it "Creamos la clase Alimento" do
    expect( Alimento.new() ).not_to eq( nil )
  end

  it "Creamos los alimentos de manera correcta" do
    expect(@chocolate).not_to eq(nil)
    expect(@pollo).not_to eq(nil)
    expect(@queso).not_to eq(nil)
  end

end

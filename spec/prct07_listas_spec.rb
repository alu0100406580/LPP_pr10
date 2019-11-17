RSpec.describe Prct07Listas do
  it "has a version number" do
    expect(Prct07Listas::VERSION).not_to be nil
  end

  describe Prct07Listas do
    before :each do
      include Enumerable, Comparable

      @lista1 = Lista.new()
      @lista2 = Lista.new()
      @alimento1 = Alimento.new( "chocolate", 5.3, 47.0, 30.0, 2.3, 3.4 )
      @alimento2 = Alimento.new( "pollo", 20.6, 0.0, 5.6, 5.7, 7.1 )
      @alimento3 = Alimento.new( "queso",  25.0, 1.3, 33.0, 11.0, 41.0 )
      @alimento4 = Alimento.new( "tofu", 8.0, 1.9, 4.8, 2.0, 2.2 )
      @alimento5 = Alimento.new( "carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.0 )
    end

    it "Creación de un método Lista" do
      expect(@lista1).not_to eq(nil)
      expect(@alimento1).not_to eq(nil)
    end
  end
end


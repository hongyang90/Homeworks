require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", :titleize => "Awesome Chef")}
  subject(:boba) { Dessert.new("drink",10,chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(boba.type).to eq("drink")
    end 

    it "sets a quantity" do
      expect(boba.quantity).to eq(10)
    end 

    it "starts ingredients as an empty array" do
      expect(boba.ingredients).to be_empty
    end 

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new('cookie','a',chef)}.to raise_error(ArgumentError)
    end 
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(boba.ingredients).to_not include("pearls")
      boba.add_ingredient("pearls")
      expect(boba.ingredients).to include("pearls")
    end
  end

  describe "#mix!" do
    before(:each) do
      boba.add_ingredient(1)
      boba.add_ingredient(2)
      boba.add_ingredient(3)
      boba.mix!
    end 
    it "shuffles the ingredient array" do 
      expect(boba.ingredients).to_not be([1,2,3])
    end 
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      boba.eat(4)
      expect(boba.quantity).to eq(6)
    end 

    it "raises an error if the amount is greater than the quantity" do
      expect { boba.eat(20) }.to raise_error("not enough left!")
    end 
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(boba.serve).to include(chef.titleize)
    end 
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(boba)
      boba.make_more
    end     
  end
end

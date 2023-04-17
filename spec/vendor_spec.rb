require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe Vendor do 
  describe 'Iteration 1' do
    it 'exists and has attributes' do
      vendor = Vendor.new("Rocky Mountain Fresh")

      expect(vendor).to be_an_instance_of(Vendor)
      expect(vendor.name).to eq("Rocky Mountain Fresh")
      expect(vendor.inventory).to eq({})
    end
  end

  describe '#check_stock' do
    it 'can check stock levels' do
      vendor = Vendor.new("Rocky Mountain Fresh")
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: '$0.50'})
      
      expect(vendor.check_stock(item1)).to eq(0)
      vendor.stock(item1, 30)
      vendor.inventory
      expect(vendor.check_stock(item1)).to eq(30)
      vendor.stock(item1, 25)
      expect(vendor.check_stock(item1)).to eq(55)
      vendor.stock(item2, 12)
      vendor.inventory
    end
  end

  # describe '#potential_revenue method' do
  #   it 'can show potential revenue of vendor' do
  #     market = Market.new("South Pearl Street Farmers Market")
  #     vendor1 = Vendor.new("Rocky Mountain Fresh")
  #     vendor2 = Vendor.new("Ba-Nom-a-Nom")
  #     vendor3 = Vendor.new("Palisade Peach Shack")
  #     item1 = Item.new({name: 'Peach', price: "$0.75"})
  #     item2 = Item.new({name: 'Tomato', price: "$0.50"})
  #     item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
  #     item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})


  #     expect(vendor1.potential_revenue).to eq(29.75)
  #     expect(vendor2.potential_revenue).to eq(345.00)
  #     expect(vendor3.potential_revenue).to eq(48.75)
  #   end
  # end
end
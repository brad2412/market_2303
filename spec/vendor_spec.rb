require './lib/item'
require './lib/vendor'

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
end
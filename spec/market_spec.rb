require 'rspec'
require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe Market do 
  describe 'Iteration 2' do
    it 'exists and has attributes' do
      market = Market.new("South Pearl Street Farmers Market")

      expect(market).to be_an_instance_of(Market)
      expect(market.name).to eq("South Pearl Street Farmers Market")
      expect(market.vendors).to eq([])
    end
  end

  describe '#stock method' do
    it 'can stock items' do
      vendor1 = Vendor.new("Rocky Mountain Fresh")
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: "$0.50"})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

      vendor1.stock(item1, 35)
      vendor1.stock(item2, 7)

      vendor2 = Vendor.new("Ba-Nom-a-Nom")

      vendor2.stock(item4, 50)
      vendor2.stock(item3, 25)

      vendor3 = Vendor.new("Palisade Peach Shack")

      vendor3.stock(item1, 65)
    end
  end

  describe '#add_vendor method' do
    it 'can add vendors to the market' do
      market = Market.new("South Pearl Street Farmers Market")
      vendor1 = Vendor.new("Rocky Mountain Fresh")
      vendor2 = Vendor.new("Ba-Nom-a-Nom")
      vendor3 = Vendor.new("Palisade Peach Shack")

      market.add_vendor(vendor1)    
      market.add_vendor(vendor2)    
      market.add_vendor(vendor3)

      expect(market.vendors).to eq([vendor1, vendor2, vendor3])
    end
  end

  describe '#vendor_names method' do
    it 'can list vendor names' do
      market = Market.new("South Pearl Street Farmers Market")
      vendor1 = Vendor.new("Rocky Mountain Fresh")
      vendor2 = Vendor.new("Ba-Nom-a-Nom")
      vendor3 = Vendor.new("Palisade Peach Shack")

      market.add_vendor(vendor1)    
      market.add_vendor(vendor2)    
      market.add_vendor(vendor3)

      expect(market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end
  end

  describe '#vendors_that_sell method' do
    it 'can show which vendor that sold an item' do
      market = Market.new("South Pearl Street Farmers Market")
      vendor1 = Vendor.new("Rocky Mountain Fresh")
      vendor2 = Vendor.new("Ba-Nom-a-Nom")
      vendor3 = Vendor.new("Palisade Peach Shack")

      market.add_vendor(vendor1)    
      market.add_vendor(vendor2)    
      market.add_vendor(vendor3)

      market.vendors_that_sell(item1)

      market.vendors_that_sell(item4)

    end
  end

  describe '#potential_revenue method' do
    it 'can show potential revenue of vendor' do
      market = Market.new("South Pearl Street Farmers Market")
      vendor1 = Vendor.new("Rocky Mountain Fresh")
      vendor2 = Vendor.new("Ba-Nom-a-Nom")
      vendor3 = Vendor.new("Palisade Peach Shack")
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: "$0.50"})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})


      expect(vendor1.potential_revenue).to eq(29.75)
      expect(vendor2.potential_revenue).to eq(345.00)
      expect(vendor3.potential_revenue).to eq(48.75)
    end
  end
end
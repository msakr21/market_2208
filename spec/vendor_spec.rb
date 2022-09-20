require 'rspec'
require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  let(:item1) {Item.new({name: 'Peach', price: "$0.75"})}
  let(:item2) {Item.new({name: 'Tomato', price: '$0.50'})}
  let(:item3) {Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})}
  let(:item4) {Item.new({name: "Banana Nice Cream", price: "$4.25"})}
  let(:vendor) {Vendor.new("Rocky Mountain Fresh")}
  let(:vendor1) {Vendor.new("Rocky Mountain Fresh")}
  let(:vendor2) {Vendor.new("Ba-Nom-a-Nom")}
  let(:vendor3) {Vendor.new("Palisade Peach Shack")}

  it "1. exists" do
    expect(vendor).to be_a(Vendor)
  end

  it "2. has readable string attribute 'name'" do
    expect(vendor.name).to eq("Rocky Mountain Fresh")
  end

  it "3. has readable hash attribute 'inventory' that is blank by default" do
    expect(vendor.inventory).to eq({})
  end

  it "4. has a method to check specific item in inventory" do
  expect(vendor.check_stock(item1)).to eq(0)
  end

 it "5. has a way to stock up on items" do
    vendor.stock(item1, 30)
    expect(vendor.inventory).to eq({item1 => 30})
    expect(vendor.check_stock(item1)).to eq(30)
    vendor.stock(item1, 25)
    expect(vendor.check_stock(item1)).to eq(55)
    vendor.stock(item2, 12)
    expect(vendor.inventory).to eq({item1 => 55, item2 => 12})
  end

  it "6 can calculate potential revenue for vendor" do
    vendor1.stock(item1, 35)
    vendor1.stock(item2, 7)
    vendor2.stock(item4, 50)
    vendor2.stock(item3, 25)
    vendor3.stock(item1, 65)

    expect(vendor1.potential_revenue).to eq(29.75)
    expect(vendor2.potential_revenue).to eq(345.00)
    expect(vendor3.potential_revenue).to eq(48.75)
  end

end
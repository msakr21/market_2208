class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, amount)
    @inventory[item] += amount
  end

  def potential_revenue
    item_potential_revenue_list = []
    @inventory. each do |item, amount|
      item_potential_revenue_list << (item.price * amount)
    end
    item_potential_revenue_list.reduce {|sum, num| sum + num}
  end
end
class Market
  attr_reader :name,
              :vendors,
              :date

  def initialize(name)
    @name = name
    @vendors = []
    @date = Date.today.strftime "%d/%m/%Y".to_s
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.inventory[item] != 0
    end
  end

  def sorted_item_list
    list = []
    @vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        (list << item.name) if quantity != 0
      end
    end
    list.uniq.sort
  end

  def total_inventory
    inventory_list = Hash.new({quantity: 0, vendors: nil})
    @vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        if inventory_list[item][:quantity] == 0
          inventory_list[item] = {quantity: quantity, vendors: vendors_that_sell(item)}
        else
          inventory_list[item][:quantity] += quantity
          inventory_list[item][:vendors] = vendors_that_sell(item)
        end
      end
    end
    inventory_list
  end

  def overstocked_items
    items = []
    total_inventory.each do |item, item_details|
      if item_details[:quantity] >= 50 && item_details[:vendors].length > 1
       items << item
      end
    end
    items
  end

  # def sell(item, amount)
  #   @vendors.each do |vendor, inventory|
  #     if inventory[item] != 0
  # end
end
class Item
  attr_reader :name,
              :price

  def initialize(item_info)
    @name = item_info[:name] 
    length_of_price = item_info[:price].length - 1
    @price = item_info[:price][1..length_of_price].to_f
  end
end
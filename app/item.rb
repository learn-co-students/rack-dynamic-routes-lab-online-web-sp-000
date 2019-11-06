class Item
  attr_accessor :name, :price

  def initialize(name,price)
    @name = name
    @price = price
    Application.item << self
  end
end

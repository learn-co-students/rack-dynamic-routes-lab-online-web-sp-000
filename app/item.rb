class Item
  attr_accessor :name, :price
  @@items = []
  def initialize(name,price)
    @name = name
    @price = price
    @@items << self
  end

  def self.findByName(name)
    @@items.each do |item|
      if item.name == name
        return item
      end
    end
    return nil
  end
end

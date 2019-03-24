class Item
  attr_accessor :name, :price

  @@all = []

  def initialize(name,price)
    @name = name
    @price = price
    @@all << self
  end

  def self.find_by_name(item)
    @@all.find{|item| item == item.name}
  end
end

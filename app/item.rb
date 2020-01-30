class Item
  attr_accessor :name, :price
  # @@all = []

  def initialize(name,price)
    @name = name
    @price = price
    #
    # @@all << self
  end

  # def self.all
  #   @@all
  # end
  #
  # def self.find_by_name(name_of_item)
  #   the_item = nil
  #   Item.all.each do |item|
  #     if item.name == name_of_item
  #       the_item = item
  #     end
  #   end
  #   the_item
  # end
end

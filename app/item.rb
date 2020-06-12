class Item
  attr_accessor :name, :price
@@all = []
  def initialize(name,price)
   # binding.pry
   
    @name = name
    @price = price
    @@all << self
  end

def self.all
  @@all
end

def self.delete_all
@@all = []
end

end

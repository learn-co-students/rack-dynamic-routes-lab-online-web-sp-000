require_relative "./config/environment.rb"
Application.class_variable_set(:@@items, [Item.new("Figs",3.42),Item.new("Pears",0.99)])
run Application.new
# Application.class_variable_set(:@@items, [Item.new("Figs",3.42),Item.new("Pears",0.99)])
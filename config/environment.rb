require 'bundler/setup'
Bundler.require

require_relative "../app/item.rb"
require_relative '../app/application'
# Application.class_variable_set(:@@items, [Item.new("Figs",3.42),Item.new("Pears",0.99)])
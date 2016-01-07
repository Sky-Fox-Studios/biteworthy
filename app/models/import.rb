require 'csv'
require 'pry'
 # Import.new("restaurants").import_all
 # Importer.new('out.txt').import_all
# Importer.new('pdp_accounts.csv').eat_accounts
# Importer.new('pdp_restaurants.csv').eat_restaurants
# Importer.new('pdp_contracts.csv').eat_contracts
# Importer.new('pdp_transactions.csv').eat_transactions
# Importer.new('pdp_contract_payments.csv').eat_contract_payments
# Importer.new('out.txt').account_that_transaction

class Import
  def initialize(file_name)
    @file_name = file_name
  end

  def import_all
    @all ||= ["restaurants", "menu_groups", "items"]
    @all.each do |one|
      eat(one)
    end
  end

  def eat(it)
    binding.pry
    file = CSV.open("#{Rails.root.join('db', 'seeds', 'csv', it)}.csv", headers: true, header_converters: :symbol, encoding: "iso-8859-1:UTF-8")
    file.map do |row|
      unless row[0].nil? || row[0].empty?
        send("import_#{it}", row.to_hash)
      else
        puts "Empty row:#{row}"
      end
    end
    nil
  end

  def import_restaurants(row)
    Restaurant.find_or_create_by(
      name:           row[:name],
      slogan:         row[:slogan],
      main_image_url: row[:image_url],
    )
  end

  def import_menu_groups(row)
    restaurant = Restaurant.find_by(name: row[:restaurant])
    MenuGroup.find_or_create_by(
      name:           row[:name],
      description:    row[:description],
      restaurant:     restaurant
    )
  end

  def import_items(row)
    restaurant = Restaurant.find_by(name: row[:restaurant])
    menu_group = MenuGroup.find_by(name: row[:menu_group])
    foods = []
    row[:foods].split(',').each do |food|
      foods << Food.find_or_create_by(name: food, restaurant: restaurant)
    end
    binding.pry
    Item.find_or_create_by(
      restaurant: restaurant,
      menu_group: menu_group,
      name: row[:item_name],
      description: row[:description],
      foods: foods,
    )
  end
end
